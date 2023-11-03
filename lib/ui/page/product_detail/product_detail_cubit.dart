import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/notification_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/product_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/product_detail_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(
      {required this.fireStoreService, required this.navigator})
      : super(const ProductDetailState());
  final FireStoreService fireStoreService;
  final ProductDetailNavigator navigator;

  void onChangedPage(value) {
    emit(state.copyWith(
      curlIndexDot: value,
    ));
  }

  void onChangedColors(value) {
    emit(state.copyWith(
      curlIndexColor: value,
    ));
  }

  void onChangedSize(value) {
    emit(state.copyWith(
      curlIndexSize: value,
    ));
  }

  void getProduct(int idProduct) async {
    emit(state.copyWith(productDetailStatus: LoadStatus.loading));
    try {
      final responseProducts = await requestProduct(idProduct);
      emit(state.copyWith(
        productDetailStatus: LoadStatus.success,
        productEntity: responseProducts,
      ));
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(productDetailStatus: LoadStatus.failure),
      );
    }
  }

  void increment() {
    emit(
      state.copyWith(
          quantity: state.quantity + 1,
          totalPrice: (state.quantity + 1) * state.price),
    );
  }

  void decrement() {
    if (state.quantity > 1) {
      emit(
        state.copyWith(
            quantity: state.quantity - 1,
            totalPrice: (state.quantity - 1) * state.price),
      );
    } else {
      emit(
        state.copyWith(quantity: 1, totalPrice: state.quantity * state.price),
      );
    }
  }

  void addToCart(int idUser) {
    try {
      CartEntity cartEntity = CartEntity(
        idUser: idUser,
        idProduct: state.productEntity?.id ?? 0,
        nameProduct: state.productEntity?.title ?? '',
        price: state.productEntity?.price ?? 0,
        quantity: state.quantity,
        imageProduct: state.productEntity!.images![0],
      );

      NotificationEntity notificationEntity = NotificationEntity(
        idUser: idUser,
        nameProduct: state.productEntity?.title ?? '',
        imageProduct: state.productEntity!.images?[0] ?? '',
        message:
        'You have successfully ordered the product ${state.productEntity?.title ?? ''}',
        timeOrder: DateTime.now().toString(),
      );
      fireStoreService.addToCart(cartEntity);
      fireStoreService.setNotification(notificationEntity);
      navigator.showSuccessFlushBar(message: 'Order success!');
    } catch (e) {
      logger.e('add to cart: $e');
    }
  }

  void getQuantityAndTotalPrice(int price) {
    emit(
      state.copyWith(price: price, totalPrice: price),
    );
  }
}
