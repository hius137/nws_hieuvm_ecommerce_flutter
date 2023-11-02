import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_switch.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class SettingOption extends StatelessWidget {
  const SettingOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBold(text: 'Setting', textSize: 18,color: 0xff000000,),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1 / 3,
          padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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

  Widget _languageOption(){
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
        const TextBold(text: 'Language', textSize: 16,color: 0xff000000,),
        const Spacer(),
        const TextEEEE(text: 'English', textSize: 12,),
        const SizedBox(width: 10),
        SvgPicture.asset(
          AppImages.icRight,
          width: 10,
          height: 10,
        ),
      ],
    );
  }

  Widget _notificationOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 11),
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
        const TextBold(text: 'Notification', textSize: 16,color: 0xff000000,),
        const Spacer(),
        const CustomSwitch(),
      ],
    );
  }

  Widget _moodOption(){
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
        const TextBold(text: 'Dark Mood', textSize: 16,color: 0xff000000,),
        const Spacer(),
        const TextEEEE(text: 'off', textSize: 12),
        const SizedBox(width: 10),
        const CustomSwitch(),
      ],
    );
  }

  Widget _helpCenterOption(){
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
        const TextBold(text: 'Help Center', textSize: 16,color: 0xff000000,),
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
