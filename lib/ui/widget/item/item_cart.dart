import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ItemCart extends StatelessWidget {
  final String nameProduct;
  final String imageProduct;
  final int totalProduct;

  const ItemCart(
      {super.key,
      required this.nameProduct,
      required this.totalProduct,
      required this.imageProduct});

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
                  image:  NetworkImage(imageProduct),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextBold(text: nameProduct, textSize: 14),
                  TextNormal(text: nameProduct, textSize: 11),
                  Spacer(),
                  TextBold(text: '$totalProduct', textSize: 14),
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
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
