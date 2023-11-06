import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class TotalPriceInCart extends StatelessWidget {
  final int length;
  final int totalPrice;

  const TotalPriceInCart(
      {super.key, required this.length, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total: $length',
          style: AppTextStyle.black14Bold,
        ),
        Text(
          '\$$totalPrice',
          style: AppTextStyle.black18Bold,
        ),
      ],
    );
  }
}
