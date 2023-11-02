import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/app_utils.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? labelText;

  const EmailTextField({
    super.key,
    required this.textEditingController,
    this.labelText,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isEmailValid = false;
  bool isUserActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Builder(builder: (context) {
        return TextFormField(
          onChanged: (value) {
            setState(() {
              isEmailValid = Utils.isEmail(value);
              isUserActive = true;
            });
          },
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              
            ),
            suffixIcon: isUserActive ? isEmailValid
                ? Image.asset(AppImages.icValid, height: 4, width: 4)
                : Image.asset(AppImages.icInvalid, height: 4, width: 4) : const SizedBox(),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1)),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty){
              return 'Please enter email';
            } else if (!Utils.isEmail(value)) {
              return "Email invalid";
            } else {
              return null;
            }
          },
          // style: const TextStyle(fontSize: 16, color: Colors.black),
        );
      }),
    );
  }
}


