import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final String initValue;
  const NormalTextField({super.key, required this.initValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding:  EdgeInsets.symmetric(vertical: 10),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
