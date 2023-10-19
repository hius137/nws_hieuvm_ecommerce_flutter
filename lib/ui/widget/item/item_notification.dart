import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ItemNotification extends StatelessWidget {
  final String nameProduct;
  final String imageProduct;
  final String message;
  final String timeOrder;

  const ItemNotification({
    super.key,
    required this.nameProduct,
    required this.timeOrder,
    required this.imageProduct,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
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
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: TextNormal(
                      text: message,
                      textSize: 14),
                ),
                TextBold(text: timeOrder, textSize: 14),
              ],
            ),
          )
        ],
      ),
    );
  }
}
