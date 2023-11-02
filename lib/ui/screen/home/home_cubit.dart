import 'package:bloc/bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void getCategories() async {
    emit(state.copyWith(categoriesStatus: LoadStatus.loading));
    try {
      final responseCategories = await requestCategories();
      final data = responseCategories?.where((element) {
        return element.totalProducts != 0;
      }).toList();
      emit(state.copyWith(
        categoriesStatus: LoadStatus.success,
        categories: data,
        currentCategories: data,
      ));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(categoriesStatus: LoadStatus.failure));
    }
  }

  Future<void> searchCategories(String inputKeyword) async {
    try {
      final suggestions = state.categories?.where((category) {
        final title = category.name?.toLowerCase();
        final input = inputKeyword.toLowerCase();
        return title?.contains(input) ?? false;
      }).toList();
      emit(state.copyWith(
        currentCategories: suggestions,
      ));
    } catch (e) {
      emit(state.copyWith(categoriesStatus: LoadStatus.failure));
    }
  }
}
