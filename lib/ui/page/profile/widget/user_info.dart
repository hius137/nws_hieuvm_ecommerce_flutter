import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/profile/widget/item_gender.dart';
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
            Text(
              'Name',
              style: AppTextStyle.black16Bold,
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
          child: Row(
            children: [
              Text(
                'Gender',
                style: AppTextStyle.black16Bold,
              ),
              const Spacer(),
              const CustomGender(text: 'Male'),
              const SizedBox(width: 10),
              const CustomGender(text: 'Female'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Age',
              style: AppTextStyle.black16Bold,
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
            Text(
              'Email',
              style: AppTextStyle.black16Bold,
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
