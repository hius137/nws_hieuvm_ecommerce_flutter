import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_screen.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  final FireStoreService fireStoreService = FireStoreService();

  void getListCart(int id) async {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try {
      await Future.delayed(const Duration(seconds: 1));
      final responseListCart = await fireStoreService.getCart(id);
      int totalPrice = 0;
      for (int i = 0; i < responseListCart.length; i++) {
        if(responseListCart[i].price != null){
          totalPrice += responseListCart[i].price! * responseListCart[i].quantity!;
        }
      }
      emit(state.copyWith(
        listCart: responseListCart,
        totalPrice: totalPrice,
        cartStatus: LoadStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(cartStatus: LoadStatus.failure));
    }
  }

  Future<void> deleteAllCart(int id) async {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try {
      await Future.delayed(const Duration(seconds: 1));
      await fireStoreService.deleteCart(id);
      emit(state.copyWith(
        listCart: [],
        cartStatus: LoadStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(cartStatus: LoadStatus.failure));
    }
  }
  void increment(int index, int price) {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try {
      List<CartEntity> listProduct = [...?state.listCart];
      int totalPrice = state.totalPrice!;
      totalPrice += price;
      listProduct[index].quantity = listProduct[index].quantity == null
          ? 1
          : (listProduct[index].quantity! + 1);
      emit(state.copyWith(
        listCart: listProduct,
        totalPrice: totalPrice,
        cartStatus: LoadStatus.success,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          cartStatus: LoadStatus.failure,
        ),
      );
    }
    ///TODO HANDLE UPDATE TO FIREBASE
  }

  int totalPriceItem( int quantity, int price){
    return quantity * price;
  }
  void decrement(int index, int price) {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try {
      if (state.listCart![index].quantity! > 1) {
        int totalPrice = state.totalPrice!;
        totalPrice -= price;
        List<CartEntity> listProduct = [...?state.listCart];
        listProduct[index].quantity = listProduct[index].quantity == null
            ? 1
            : (listProduct[index].quantity! - 1);
        emit(
          state.copyWith(
            listCart: listProduct,
            totalPrice: totalPrice,
            cartStatus: LoadStatus.success,
          ),
        );
      }else{
        List<CartEntity> listProduct = [...?state.listCart];
        listProduct[index].quantity = 1;
        emit(
          state.copyWith(
            listCart: listProduct,
            totalPrice: state.totalPrice,
            cartStatus: LoadStatus.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          cartStatus: LoadStatus.failure,
        ),
      );
    }

    ///TODO HANDLE UPDATE TO FIREBASE
  }

  void navHome(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const MainScreen(),
      ),
    );
  }
}
