import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  void initState() {
    super.initState();
    cartCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppImages.icBack,
                      height:50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const TextBold(text: 'My Cart', textSize: 18),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 16,
                    children: List.generate(3, (index) {
                      return const ItemCart();
                    }),
                  )
                ],
              ),
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(text: 'Total (3 item):', textSize: 11),
                TextBold(text: '\$500', textSize: 18),
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
                    const Text("Proceed to Checkout"),
                    SvgPicture.asset(
                      AppImages.icCheckOut,
                      height: 30,
                      width: 30,
                    )
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
