import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/app_utils.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? labelText;

  const PasswordTextField(
      {super.key, required this.textEditingController, this.labelText});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: _obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        if (!Utils.isPassword(value)) {
          return "Password invalid";
        }
        return null;
      },
    );
  }
}
