import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      initialValue: 'hieu',
      decoration: const InputDecoration(
        isDense: true,
        contentPadding:  EdgeInsets.symmetric(vertical: 10),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
