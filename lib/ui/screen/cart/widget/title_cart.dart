import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class TitleCart extends StatelessWidget {
  const TitleCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextBold(
      text: 'My Cart',
      textSize: 18,
      color: 0xff000000,
    );
  }
}
