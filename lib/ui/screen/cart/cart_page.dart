import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/cart_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/cart_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/widget/check_out_cart.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/widget/item_cart.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/widget/title_cart.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/widget/total_price_in_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) {
        final fireStoreService = FireStoreService();
        final navigator = CartNavigator(context: context);
        return CartCubit(
          fireStoreService: fireStoreService,
          navigator: navigator,
        );
      },
      child: const CartPageBody(),
    );
  }
}

class CartPageBody extends StatefulWidget {
  const CartPageBody({super.key});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody>
    with AutomaticKeepAliveClientMixin {
  late CartCubit cartCubit;
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.getListCart(appCubit.state.userEntity!.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBodyPage();
  }

  Widget _buildBodyPage(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) {
          return previous.cartStatus != current.cartStatus;
        },
        builder: (context, state) {
          if (state.cartStatus == LoadStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.cartStatus == LoadStatus.success) {
            return Column(
              children: [
                SizedBox(
                  height: size.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleCart(),
                      const SizedBox(height: 20),
                      if (state.listCart != null &&
                          state.listCart!.isNotEmpty)
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              cartCubit.getListCart(
                                  appCubit.state.userEntity!.id ?? 0);
                            },
                            child: ListView.separated(
                              itemCount: state.listCart!.length,
                              itemBuilder: (context, index) {
                                final listCart = state.listCart?[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: ItemCart(
                                    totalPrice: (listCart?.quantity ?? 0) *
                                        (listCart?.price ?? 0),
                                    quantity: listCart?.quantity ?? 0,
                                    nameProduct: listCart?.nameProduct ?? '',
                                    imageProduct:
                                    listCart?.imageProduct ?? '',
                                    price: listCart?.price ?? 0,
                                    increment: () {
                                      cartCubit.increment(index,
                                          state.listCart?[index].price ?? 0);
                                    },
                                    decrement: () {
                                      cartCubit.decrement(index,
                                          state.listCart?[index].price ?? 0);
                                    },
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox();
                              },
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                const Spacer(),
                TotalPriceInCart(
                    length: state.listCart?.length ?? 0,
                    totalPrice: state.totalPrice ?? 0),
                const Spacer(),
                const CheckOutCart(),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
