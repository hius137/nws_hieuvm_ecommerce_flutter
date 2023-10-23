import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/cart_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_cart.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: const CartScreenBody(),
    );
  }
}

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  late CartCubit cartCubit;
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    cartCubit = BlocProvider.of(context);
    cartCubit.getListCart(appCubit.state.userEntity!.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: size.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            AppImages.icBack,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const TextBold(text: 'My Cart', textSize: 18)),
                      const SizedBox(height: 10),
                      state.listCart != null && state.listCart!.isNotEmpty
                          ? Expanded(
                              child: ListView.separated(
                                itemCount: state.listCart!.length,
                                addAutomaticKeepAlives: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    child: ItemCart(
                                      quantity: state.listCart?[index].quantity ??
                                          0,
                                      nameProduct:
                                          state.listCart?[index].nameProduct ??
                                              '',
                                      imageProduct:
                                          state.listCart?[index].imageProduct ??
                                              '',
                                      totalProduct:
                                          state.listCart?[index].totalPrice ??
                                              0,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox();
                                },
                              ),
                            )
                          : const Expanded(child: Center(child: CircularProgressIndicator())),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBold(
                        text: 'Total ${state.listCart?.length}', textSize: 11),
                    const TextBold(text: '\$500', textSize: 18),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Proceed to Checkout",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SvgPicture.asset(
                          AppImages.icCheckOut,
                          height: 30,
                          width: 30,
                        )
                      ]),
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
