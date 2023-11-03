import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class TotalPriceInCart extends StatelessWidget {
  final int length;
  final int totalPrice;
  const TotalPriceInCart({super.key, required this.length, required this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBold(
          text: 'Total: $length',
          textSize: 14,
          color: 0xff000000,
        ),
        TextBold(
          text: '\$$totalPrice',
          textSize: 18,
          color: 0xff000000,
        ),
      ],
    );
  }
}
