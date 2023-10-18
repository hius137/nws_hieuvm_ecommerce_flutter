part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartEntity>? listCart;

  @override
  List<Object?> get props => [
        listCart,
      ];

  const CartState({
    this.listCart,
  });

  CartState copyWith({
    List<CartEntity>? listCart,
  }) {
    return CartState(
      listCart: listCart ?? this.listCart,
    );
  }
}
