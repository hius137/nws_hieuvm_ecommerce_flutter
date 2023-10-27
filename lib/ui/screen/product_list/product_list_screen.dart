import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_detail/product_detail_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/product_list_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_product.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
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
      child: ProductListScreenBody(
        idCategories: idCategories,
        nameCategories: nameCategories,
      ),
    );
  }
}

class ProductListScreenBody extends StatefulWidget {
  final int idCategories;
  final String nameCategories;

  const ProductListScreenBody({
    super.key,
    required this.idCategories,
    required this.nameCategories,
  });

  @override
  State<ProductListScreenBody> createState() => _ProductListScreenBodyState();
}

class _ProductListScreenBodyState extends State<ProductListScreenBody> {
  late ProductListCubit productListCubit;

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
                      SvgPicture.asset(
                        AppImages.icSearch,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<ProductListCubit, ProductListState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBold(text: widget.nameCategories, textSize: 20),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<ProductListCubit, ProductListState>(
                buildWhen: (previous, current) => previous.productListStatus != current.productListStatus,
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
                                  childAspectRatio: 0.75),
                          itemCount: state.listProduct?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      price: state.listProduct?[index].price ?? 0,
                                      idProduct:
                                          state.listProduct?[index].id ?? 0,
                                    ),
                                  ),
                                );
                              },
                              child: ItemProduct(
                                imageProduct:
                                    state.listProduct?[index].images?[0] ?? '',
                                nameProduct:
                                    state.listProduct?[index].title ?? '',
                                priceProduct:
                                    state.listProduct?[index].price ?? 0,
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ]),
        child: const GNav(
          backgroundColor: Colors.white,
          color: Colors.white,
          activeColor: Color(0xff000000),
          tabBackgroundColor: Color(0xffeeeeee),
          gap: 8,
          padding: EdgeInsets.all(10),
          tabs: [
            GButton(
              icon: Icons.home_filled,
              iconColor: Colors.black,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart_rounded,
              iconColor: Colors.black,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.notifications,
              iconColor: Colors.black,
              text: 'Notification',
            ),
            GButton(
              icon: Icons.account_circle,
              iconColor: Colors.black,
              text: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
