import 'package:bloc/bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void getCategories() async {
    emit(state.copyWith(categoriesStatus: LoadStatus.loading));
    try {
      final responseCategories = await requestCategories();
      emit(state.copyWith(
        categoriesStatus: LoadStatus.success,
        listCategories: responseCategories,
      ));
    } catch (e) {
      print('categories =>>> $e');
      emit(state.copyWith(categoriesStatus: LoadStatus.failure));
    }
  }

  // void addSearchedFOrItemsToSearchedList(String searchedCategories) {
  //   final List<CategoriesEntity> allCategories;
  //   emit(state.copyWith(
  //     listCategories: allCategories.where((categories) =>
  //         categories.name!.toLowerCase().startsWith(searchedCategories)).toList();
  //   ));
  // }
}
