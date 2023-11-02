import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/component/item_dot.dart';

class ListDot extends StatelessWidget {
  final int curlIndexDot;
  const ListDot({super.key, required this.curlIndexDot});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => buildDot(index, curlIndexDot, context),
      ),
    );
  }
}
