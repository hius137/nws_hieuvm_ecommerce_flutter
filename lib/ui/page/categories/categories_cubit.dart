import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/categories_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(const CategoriesState());

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
