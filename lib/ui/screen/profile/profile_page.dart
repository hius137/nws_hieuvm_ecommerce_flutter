import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_gender.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_switch.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/normal_textfield.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return ProfileCubit(appCubit: appCubit);
      },
      child: const ProfilePageBody(),
    );
  }
}

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> with AutomaticKeepAliveClientMixin{
  late ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = BlocProvider.of(context);
    profileCubit.getUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, right: 20, left: 20),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 90,
                      height: 90,
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppImages.imgOnboarding1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: SvgPicture.asset(
                            AppImages.icPen,
                            width: 5,
                            height: 5,
                          )),
                    )
                  ],
                ),
                const TextBold(text: 'Upload image', textSize: 16,color: 0xff000000,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextBoldEEEE(text: 'Name', textSize: 16,),
                    SizedBox(
                      // height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: NormalTextField(initValue: state.user?.name ?? ''),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.16),
                  child: const Row(
                    children: [
                      TextBoldEEEE(text: 'Gender', textSize: 16),
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
                    const TextBoldEEEE(text: 'Age', textSize: 16),
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
                    const TextBoldEEEE(text: 'Email', textSize: 16),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: NormalTextField(
                          initValue: state.user?.email ?? ''),
                    ),
                  ],
                ),
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
                      Row(
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
                      ),
                      Row(
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
                      ),
                      Row(
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
                      ),
                      Row(
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
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    profileCubit.signOut();
                    profileCubit.navSignIn(context);

                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.icLogOut,
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(width: 10),
                        const TextBold(
                          text: 'Log out',
                          textSize: 16,
                          color: 0xffffffff,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
