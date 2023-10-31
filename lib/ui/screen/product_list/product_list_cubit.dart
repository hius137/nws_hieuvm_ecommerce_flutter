import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/product_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(const ProductListState());

  void getListProducts(int idCategories) async{
    emit(state.copyWith(productListStatus: LoadStatus.loading));
    try {
      final responseListProducts = await requestListProduct(idCategories);
      emit(state.copyWith(
        productListStatus: LoadStatus.success,
        listProduct: responseListProducts,
        currentProducts: responseListProducts,
      ));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(productListStatus: LoadStatus.failure));
    }
  }

  Future<void> searchProduct(String inputKeyword) async {
    try {
      final suggestions = state.listProduct?.where((product) {
        final title = product.title?.toLowerCase();
        final input = inputKeyword.toLowerCase();
        return title?.contains(input) ?? false;
      }).toList();
      emit(state.copyWith(
        currentProducts: suggestions,
      ));
    } catch (e) {
      emit(state.copyWith(productListStatus: LoadStatus.failure));
    }
  }

  void isSearch(){
    emit(state.copyWith(isSearch: !state.isSearch));
  }
}
