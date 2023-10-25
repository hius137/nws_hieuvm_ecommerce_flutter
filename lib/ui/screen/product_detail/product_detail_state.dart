part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  final LoadStatus productDetailStatus;
  final ProductEntity? productEntity;
  final CartEntity? cartEntity;
  final int curlIndexDot;
  final int curlIndexColor;
  final int curlIndexSize;
  final int quantity;
  final int price;
  final int totalPrice;

  @override
  List<Object?> get props => [
    productDetailStatus,
    productEntity,
    cartEntity,
    curlIndexDot,
    curlIndexColor,
    curlIndexSize,
    quantity,
    price,
    totalPrice,
  ];

  const ProductDetailState({
    this.productDetailStatus = LoadStatus.initial,
    this.productEntity,
    this.cartEntity,
    this.curlIndexDot = 1,
    this.curlIndexColor = 0,
    this.curlIndexSize = 0,
    this.quantity = 1,
    this.price = 0,
    this.totalPrice = 0,
  });

  ProductDetailState copyWith({
    LoadStatus? productDetailStatus,
    ProductEntity? productEntity,
    CartEntity? cartEntity,
    int? curlIndexDot,
    int? curlIndexColor,
    int? curlIndexSize,
    int? quantity,
    int? price,
    int? totalPrice,
  }) {
    return ProductDetailState(
      productDetailStatus: productDetailStatus ?? this.productDetailStatus,
      productEntity: productEntity ?? this.productEntity,
      cartEntity: cartEntity ?? this.cartEntity,
      curlIndexDot: curlIndexDot ?? this.curlIndexDot,
      curlIndexColor: curlIndexColor ?? this.curlIndexColor,
      curlIndexSize: curlIndexSize ?? this.curlIndexSize,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
