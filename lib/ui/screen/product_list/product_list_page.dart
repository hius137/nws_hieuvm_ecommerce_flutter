import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_detail/product_detail_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/product_list_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_product.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.idCategories,
    required this.nameCategories,
  });

  final int idCategories;
  final String nameCategories;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListCubit>(
      create: (context) => ProductListCubit(),
      child: ProductListPageBody(
        idCategories: idCategories,
        nameCategories: nameCategories,
      ),
    );
  }
}

class ProductListPageBody extends StatefulWidget {
  final int idCategories;
  final String nameCategories;

  const ProductListPageBody({
    super.key,
    required this.idCategories,
    required this.nameCategories,
  });

  @override
  State<ProductListPageBody> createState() => _ProductListPageBodyState();
}

class _ProductListPageBodyState extends State<ProductListPageBody> {
  late ProductListCubit productListCubit;
  final _searchProductController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productListCubit = BlocProvider.of(context);
    productListCubit.getListProducts(widget.idCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: SvgPicture.asset(
                          AppImages.icBack,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      BlocBuilder<ProductListCubit, ProductListState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              productListCubit.isSearch();
                            },
                            child: state.isSearch == true
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: TextField(
                                      controller: _searchProductController,
                                      decoration: InputDecoration(
                                        border:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(width: 10),
                                            SvgPicture.asset(
                                              AppImages.icSearch,
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                        filled: true,
                                        fillColor: Colors.black12,
                                        hintText: 'Search...',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 10,
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                          minWidth: 20,
                                          minHeight: 20,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        productListCubit.searchProduct(value);
                                      },
                                    ),
                                  )
                                : SvgPicture.asset(
                                    AppImages.icSearch,
                                    width: 20,
                                    height: 20,
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<ProductListCubit, ProductListState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBold(
                            text: widget.nameCategories,
                            textSize: 20,
                            color: 0xff000000,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<ProductListCubit, ProductListState>(
                buildWhen: (previous, current) =>
                    previous.currentProducts != current.currentProducts,
                builder: (context, state) {
                  if (state.productListStatus == LoadStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.productListStatus == LoadStatus.success) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          // mainAxisExtent: MediaQuery.of(context).size.width / 2,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.currentProducts?.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                    price: state.currentProducts?[index].price ?? 0,
                                    idProduct:
                                        state.currentProducts?[index].id ?? 0,
                                  ),
                                ),
                              );
                            },
                            child: ItemProduct(
                              imageProduct:
                                  state.currentProducts?[index].images?[0] ?? '',
                              nameProduct:
                                  state.currentProducts?[index].title ?? '',
                              priceProduct:
                                  state.currentProducts?[index].price ?? 0,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
