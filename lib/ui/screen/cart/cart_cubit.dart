import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

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
      emit(state.copyWith(
          listCart: responseListCart, cartStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(cartStatus: LoadStatus.failure));
    }
  }

  void increment(int index) {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try{
      List<CartEntity> listProduct = [...?state.listCart];
      listProduct[index].quantity = listProduct[index].quantity == null
          ? 1
          : (listProduct[index].quantity! + 1);
      emit(state.copyWith(
        listCart: listProduct,
        cartStatus: LoadStatus.success,
      ));
    }catch(e){
      emit(
        state.copyWith(
          cartStatus: LoadStatus.failure,
        ),
      );
    }

    ///TODO HANDLE UPDATE TO FIREBASE
  }

  void decrement(int index) {
    emit(
      state.copyWith(cartStatus: LoadStatus.loading),
    );
    try {
      if (state.listCart![index].quantity! > 1) {
        state.listCart?[index].quantity =
            state.listCart?[index].quantity == null
                ? 0
                : (state.listCart![index].quantity! - 1);
        List<CartEntity> listProduct = [...?state.listCart];
        emit(
          state.copyWith(
            listCart: listProduct,
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
}
