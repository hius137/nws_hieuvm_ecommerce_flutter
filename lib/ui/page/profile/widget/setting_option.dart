import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_switch.dart';

class SettingOption extends StatelessWidget {
  const SettingOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setting',
              style: AppTextStyle.black18Bold,
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1 / 3,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black54, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _languageOption(),
              _notificationOption(),
              _moodOption(),
              _helpCenterOption(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _languageOption() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            AppImages.icWorld,
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'Language',
          style: AppTextStyle.black16Bold,
        ),
        const Spacer(),
        Text(
          'English',
          style: AppTextStyle.black12W,
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          AppImages.icRight,
          width: 10,
          height: 10,
        ),
      ],
    );
  }

  Widget _notificationOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          decoration: BoxDecoration(
            color: const Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            AppImages.icNotification,
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'Notification',
          style: AppTextStyle.black16Bold,
        ),
        const Spacer(),
        const CustomSwitch(),
      ],
    );
  }

  Widget _moodOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            AppImages.icMoon,
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'Dark Mood',
          style: AppTextStyle.black16Bold,
        ),
        const Spacer(),
        Text(
          'off',
          style: AppTextStyle.black12W,
        ),
        const SizedBox(width: 10),
        const CustomSwitch(),
      ],
    );
  }

  Widget _helpCenterOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            AppImages.icQuestion,
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'Help Center',
          style: AppTextStyle.black16Bold,
        ),
        const Spacer(),
        SvgPicture.asset(
          AppImages.icRight,
          width: 10,
          height: 10,
        ),
      ],
    );
  }
}
