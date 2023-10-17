part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  final LoadStatus productListStatus;
  final List<ProductEntity>? listProduct;
  @override
  List<Object?> get props => [
    productListStatus,
    listProduct,
  ];

  const ProductListState({
    this.productListStatus = LoadStatus.initial,
    this.listProduct,
  });

  ProductListState copyWith({
    LoadStatus? productListStatus,
    List<ProductEntity>? listProduct,
    String? tilteList,
  }) {
    return ProductListState(
      productListStatus: productListStatus ?? this.productListStatus,
      listProduct: listProduct ?? this.listProduct,
    );
  }
}
