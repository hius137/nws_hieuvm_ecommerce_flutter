part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  final LoadStatus productDetailStatus;
  final ProductEntity? productEntity;
  final int curlIndex;
  final int quantity;
  final int price;
  final int totalPrice;

  @override
  List<Object?> get props => [
    productDetailStatus,
    productEntity,
    curlIndex,
    quantity,
    price,
    totalPrice,
  ];

  const ProductDetailState({
    this.productDetailStatus = LoadStatus.initial,
    this.productEntity,
    this.curlIndex = 1,
    this.quantity = 1,
    this.price = 0,
    this.totalPrice = 0,
  });

  ProductDetailState copyWith({
    LoadStatus? productDetailStatus,
    ProductEntity? productEntity,
    int? curlIndex,
    int? quantity,
    int? price,
    int? totalPrice,
  }) {
    return ProductDetailState(
      productDetailStatus: productDetailStatus ?? this.productDetailStatus,
      productEntity: productEntity ?? this.productEntity,
      curlIndex: curlIndex ?? this.curlIndex,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
