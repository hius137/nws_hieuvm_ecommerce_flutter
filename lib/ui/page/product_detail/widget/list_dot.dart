import 'package:flutter/material.dart';

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

Container buildDot(int index, int curIndex, BuildContext context) {
  return Container(
    height: 12,
    width: 12,
    padding: const EdgeInsets.all(2),
    margin: const EdgeInsets.only(right: 2),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 1,
            color: index == curIndex ? Colors.white : Colors.transparent),
        color: Colors.transparent),
    child: Container(
      height: 6,
      width: 6,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    ),
  );
}
