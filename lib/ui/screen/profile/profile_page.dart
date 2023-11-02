import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/widget/user_info.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/widget/image_header.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/widget/setting_option.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        final navigator = ProfileNavigator(context: context);
        return ProfileCubit(appCubit: appCubit, navigator: navigator);
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
                const ImageHeader(),
                const TextBold(text: 'Upload image', textSize: 16,color: 0xff000000,),
                UserInfo(userName: state.user?.name ?? '', email: state.user?.email ?? ''),
                const SettingOption(),
                _signOutButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _signOutButton(){
    return InkWell(
      onTap: () {
        profileCubit.signOut();
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
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    profileCubit.close();
    super.dispose();
  }
}
