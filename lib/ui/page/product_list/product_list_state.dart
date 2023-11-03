part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  final LoadStatus productListStatus;
  final List<ProductEntity>? listProduct;
  final List<ProductEntity>? currentProducts;
  final bool isSearch;
  @override
  List<Object?> get props => [
    productListStatus,
    listProduct,
    currentProducts,
    isSearch,
  ];

  const ProductListState({
    this.productListStatus = LoadStatus.initial,
    this.listProduct,
    this.currentProducts,
    this.isSearch = false,
  });

  ProductListState copyWith({
    LoadStatus? productListStatus,
    List<ProductEntity>? listProduct,
    List<ProductEntity>? currentProducts,
    bool? isSearch,
  }) {
    return ProductListState(
      productListStatus: productListStatus ?? this.productListStatus,
      listProduct: listProduct ?? this.listProduct,
      currentProducts: currentProducts ?? this.currentProducts,
      isSearch: isSearch ?? this.isSearch,
    );
  }
}
