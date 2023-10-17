import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: const ProfileScreenBody(),
    );
  }
}

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(AppImages.noImage),
            ),
          ),
          const TextBold(text: 'Upload image', textSize: 16),
          const Row(
            children: [
              TextEEEE(text: 'Name', textSize: 16),
            ],
          ),
          Row(
            children: [
              const TextEEEE(text: 'Gender', textSize: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1,
                              color: Colors.white),
                          color: Colors.transparent),
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const TextEEEE(text: 'Male', textSize: 16),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1,
                              color: Colors.white),
                          color: Colors.transparent),
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const TextEEEE(text: 'Female', textSize: 16),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            children: [
              TextEEEE(text: 'Age', textSize: 16),
            ],
          ),
          const Row(
            children: [
              TextEEEE(text: 'Email', textSize: 16),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBold(text: 'Setting', textSize: 18),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black54,
                width: 1
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xffeeeeee)
                      ),
                      child: SvgPicture.asset(AppImages.icWorld,width: 20,height: 20,),
                    ),
                    const TextBold(text: 'Language', textSize: 16),
                    const TextEEEE(text: 'English', textSize: 12),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffeeeeee)
                      ),
                      child: SvgPicture.asset(AppImages.icWorld,width: 20,height: 20,),
                    ),
                    const TextBold(text: 'Language', textSize: 16),
                    const TextEEEE(text: 'English', textSize: 12),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffeeeeee)
                      ),
                      child: SvgPicture.asset(AppImages.icWorld,width: 20,height: 20,),
                    ),
                    const TextBold(text: 'Language', textSize: 16),
                    const TextEEEE(text: 'English', textSize: 12),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffeeeeee)
                      ),
                      child: SvgPicture.asset(AppImages.icWorld,width: 20,height: 20,),
                    ),
                    const TextBold(text: 'Language', textSize: 16),
                    const TextEEEE(text: 'English', textSize: 12),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
