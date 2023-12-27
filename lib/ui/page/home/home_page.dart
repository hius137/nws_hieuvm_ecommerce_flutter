import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/home_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/home_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/home_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/widget/item_search.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/widget/list_categories.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/widget/search_empty.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        final navigator = HomeNavigator(context: context);
        return HomeCubit(navigator: navigator);
      },
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with AutomaticKeepAliveClientMixin {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                    AppImages.icMenu,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Image(
                      image: AssetImage(
                        AppImages.icAvatar,
                      ),
                      fit: BoxFit.fill,
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: AppTextStyle.black18Bold,
                ),
                Text(
                  "Our Fashions App",
                  style: AppTextStyle.black16W,
                ),
              ],
            )
          ],
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
