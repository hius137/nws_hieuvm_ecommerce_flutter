import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class ItemOnboarding extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;

  const ItemOnboarding(
      {super.key,
      required this.text1,
      required this.text2,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            transform: Matrix4.skewY(-0.07),
            height: MediaQuery.of(context).size.height / 2 + 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          text1,
          style: AppTextStyle.black28Bold,
        ),
        const SizedBox(height: 10),
        Text(
          text2,
          style: AppTextStyle.black18W,
        ),
      ],
    );
  }
}
