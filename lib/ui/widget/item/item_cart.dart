import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 325,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          bottom: 10,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  width: 80,
                  image: const AssetImage(AppImages.imgOnboarding1),
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.network(
                      AppImages.noImage,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextBold(text: 'Name Product', textSize: 14),
                  TextNormal(text: 'Name Product', textSize: 11),
                  Spacer(),
                  TextBold(text: '\$Price', textSize: 14),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 80,
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xffeeeeee),
            ),
            // ignore: prefer_const_constructors
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextNormal(text: '-', textSize: 14),
                const TextNormal(text: '1', textSize: 14),
                const TextNormal(text: '+', textSize: 14),
              ],
            ),
          ),
        )
      ],
    );
  }
}
