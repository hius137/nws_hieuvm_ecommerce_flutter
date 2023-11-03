import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

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
        TextBold(
          text: text1,
          textSize: 30,
          color: 0xff000000,
        ),
        const SizedBox(height: 10),
        TextNormal(
          text: text2,
          textSize: 18,
          color: 0x73000000,
        ),
      ],
    );
  }
}
