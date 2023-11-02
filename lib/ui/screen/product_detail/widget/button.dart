import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff000000),
          width: 1,
        ),
        color: const Color(0xff000000),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.icBagBlack),
          const SizedBox(width: 10),
          const TextBold(
            text: 'Add to cart',
            textSize: 18,
            color: 0xffffffff,
          ),
        ],
      ),
    );
  }
}
