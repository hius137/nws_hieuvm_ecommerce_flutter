import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/product_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';

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
      ));
    } catch (e) {
      print('categories =>>> $e');
      emit(state.copyWith(productListStatus: LoadStatus.failure));
    }
  }
}
