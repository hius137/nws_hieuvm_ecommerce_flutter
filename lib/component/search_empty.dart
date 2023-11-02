import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.imgSearchEmpty),
          const TextNormal(
            text: 'File not found, Try search again',
            textSize: 14,
          ),
        ],
      ),
    );
  }
}
