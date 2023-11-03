import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/cart/cart_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class CheckOutCart extends StatefulWidget {
  const CheckOutCart({super.key});

  @override
  State<CheckOutCart> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
  late CartCubit cartCubit;
  late AppCubit appCubit;
  @override
  void initState() {
    cartCubit = BlocProvider.of<CartCubit>(context);
    appCubit = context.read<AppCubit>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => cartCubit
          .deleteAllCart(appCubit.state.userEntity!.id ?? 0),
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextBold(
                text: 'Proceed to Checkout',
                textSize: 16,
                color: 0xffffffff,
              ),
            ),
            SvgPicture.asset(
              AppImages.icCheckOut,
              height: 30,
              width: 30,
            )
          ],
        ),
      ),
    );
  }

}
