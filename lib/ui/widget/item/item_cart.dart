import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ItemCart extends StatelessWidget {
  final String nameProduct;
  final String imageProduct;
  final int price;
  final int quantity;
  final int totalPrice;
  final Function() increment;
  final Function() decrement;

  const ItemCart({
    super.key,
    required this.nameProduct,
    required this.price,
    required this.imageProduct,
    required this.quantity,
    required this.increment,
    required this.decrement,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
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
      child: Stack(
        children: [
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
                    image: NetworkImage(imageProduct),
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
                    const Spacer(),
                    TextBold(text: '\$$totalPrice', textSize: 14),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffeeeeee),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: decrement,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12,),
                        child: SvgPicture.asset(
                          AppImages.icMinus,
                          width: 2,
                          height: 2,
                        ),
                      ),
                    ),
                    TextBold(text: '$quantity', textSize: 16),
                    InkWell(
                      onTap: increment,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: SvgPicture.asset(
                          AppImages.icPlus,
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
