import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/component/item_gender.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/normal_textfield.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String email;

  const UserInfo({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextBold(
              text: 'Name',
              textSize: 16,
              color: 0x71000000,
            ),
            SizedBox(
              // height: 30,
              width: MediaQuery.of(context).size.width * 0.6,
              child: NormalTextField(initValue: userName),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.16,
            top: 10,
          ),
          child: const Row(
            children: [
              TextBold(
                text: 'Gender',
                textSize: 16,
                color: 0x61000000,
              ),
              Spacer(),
              CustomGender(text: 'Male'),
              SizedBox(width: 10),
              CustomGender(text: 'Female'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextBold(
              text: 'Age',
              textSize: 16,
              color: 0x61000000,
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.6,
              child: const NormalTextField(initValue: ''),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextBold(
              text: 'Email',
              textSize: 16,
              color: 0x61000000,
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.6,
              child: NormalTextField(initValue: email),
            ),
          ],
        ),
      ],
    );
  }
}
