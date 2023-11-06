import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class TitleCart extends StatelessWidget {
  const TitleCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Cart',
      style: AppTextStyle.black18Bold,
    );
  }
}
