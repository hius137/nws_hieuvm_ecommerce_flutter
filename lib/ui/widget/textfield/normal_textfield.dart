import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: 'hieu',
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1)),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
