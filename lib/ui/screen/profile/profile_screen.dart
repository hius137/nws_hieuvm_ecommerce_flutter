import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/switch.dart';
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: SizedBox(
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
            ),
            const TextBold(text: 'Upload image', textSize: 16),
            const Row(
              children: [
                TextBoldEEEE(text: 'Name', textSize: 16),
              ],
            ),
            Row(
              children: [
                const TextBoldEEEE(text: 'Gender', textSize: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.black),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.black),
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
                TextBoldEEEE(text: 'Age', textSize: 16),
              ],
            ),
            const Row(
              children: [
                TextBoldEEEE(text: 'Email', textSize: 16),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBold(text: 'Setting', textSize: 18),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1/3,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      const TextBold(text: 'Language', textSize: 16),
                      const Spacer(),
                      const TextEEEE(text: 'English', textSize: 12),
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
                      const TextBold(text: 'Notification', textSize: 16),
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
                      const TextBold(text: 'Dark Mood', textSize: 16),
                      const Spacer(),
                      const TextEEEE(text: 'off', textSize: 12),
                      SizedBox(width: 10),
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
                      const TextBold(text: 'Help Center', textSize: 16),
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
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(vertical:  10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  AppImages.icLogOut,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                Text("Log Out",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
