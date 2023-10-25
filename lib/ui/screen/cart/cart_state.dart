part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartEntity>? listCart;
  final LoadStatus cartStatus;

  @override
  List<Object?> get props => [
        listCart,
    cartStatus,
      ];

  const CartState({
    this.listCart,
    this.cartStatus = LoadStatus.initial,
  });

  CartState copyWith({
    List<CartEntity>? listCart,
    LoadStatus? cartStatus,
  }) {
    return CartState(
      listCart: listCart ?? this.listCart,
      cartStatus: cartStatus ?? this.cartStatus,
    );
  }
}
