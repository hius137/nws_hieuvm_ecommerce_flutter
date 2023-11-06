import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.imgSearchEmpty),
          Text(
            'File not found, Try search again',
            style: AppTextStyle.blackS14W,
          ),
        ],
      ),
    );
  }
}
