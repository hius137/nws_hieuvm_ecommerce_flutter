import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_list/widget/item_product.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/widget/search_empty.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/product_detail_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_list/product_list_cubit.dart';

class ListProductBody extends StatefulWidget {
  const ListProductBody({super.key});

  @override
  State<ListProductBody> createState() => _ListProductBodyState();
}

class _ListProductBodyState extends State<ListProductBody> {
  late ProductListCubit productListCubit;

  @override
  void initState() {
    productListCubit = BlocProvider.of(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      buildWhen: (previous, current) =>
          previous.currentProducts != current.currentProducts,
      builder: (context, state) {
        if (state.productListStatus == LoadStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.productListStatus == LoadStatus.success) {
          return state.currentProducts!.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15,
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
                )
              : const Expanded(
                  child: SearchEmpty(),
                );
        } else {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
