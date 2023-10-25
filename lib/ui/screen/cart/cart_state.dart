part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartEntity>? listCart;
  final LoadStatus cartStatus;
  final int? totalPrice;

  @override
  List<Object?> get props => [
        listCart,
    cartStatus,
    totalPrice,
      ];

  const CartState({
    this.listCart,
    this.totalPrice,
    this.cartStatus = LoadStatus.initial,
  });

  CartState copyWith({
    List<CartEntity>? listCart,
    LoadStatus? cartStatus,
    int? totalPrice,
  }) {
    return CartState(
      listCart: listCart ?? this.listCart,
      cartStatus: cartStatus ?? this.cartStatus,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
