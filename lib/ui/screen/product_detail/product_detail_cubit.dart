import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/product_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState());
  PageController pageController = PageController();
  void onChangedPage(value){
    int currentIndex = value;
    emit(state.copyWith(
      curlIndex: currentIndex,
    ));
  }

  void getProduct(int idProduct) async{
    emit(state.copyWith(productDetailStatus: LoadStatus.loading));
    try {
      final responseProducts = await requestProduct(idProduct);
      emit(state.copyWith(
        productDetailStatus: LoadStatus.success,
        productEntity: responseProducts,
      ));
    } catch (e) {
      print('product =>>> $e');
      emit(state.copyWith(productDetailStatus: LoadStatus.failure));
    }
  }

  void increment(){
    emit(state.copyWith(
      quantity: state.quantity + 1,
      totalPrice: (state.quantity + 1) * state.price
    ));
  }

  void decrement(){
    if(state.quantity > 1){
      emit(state.copyWith(
        quantity: state.quantity - 1,
          totalPrice: (state.quantity - 1) * state.price
      ));
    }else{
      emit(state.copyWith(
        quantity: 1,
          totalPrice: state.quantity * state.price
      ));
    }
  }

  void getQuanAndTotalPrice(int price){
    emit(state.copyWith(
      price: price,
      totalPrice: price
    ));
  }

}
