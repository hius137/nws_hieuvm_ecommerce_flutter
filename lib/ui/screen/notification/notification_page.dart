import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/notification/notification_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_notification.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: const NotificationPageBody(),
    );
  }
}

class NotificationPageBody extends StatefulWidget {
  const NotificationPageBody({super.key});

  @override
  State<NotificationPageBody> createState() => _NotificationPageBodyState();
}

class _NotificationPageBodyState extends State<NotificationPageBody>
    with AutomaticKeepAliveClientMixin {
  late NotificationCubit notificationCubit;
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    notificationCubit = BlocProvider.of(context);
    notificationCubit.getListNotification(appCubit.state.userEntity!.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            buildWhen: (previous, current) =>
                previous.notificationStatus != current.notificationStatus,
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  AppImages.icBack,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            // const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffeeeeee),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const TextBold(
                            text: 'Notification',
                            textSize: 18,
                            color: 0xff000000,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (state.notificationStatus == LoadStatus.success &&
                            state.listNotification!.isNotEmpty)
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                notificationCubit.getListNotification(
                                    appCubit.state.userEntity!.id ?? 0);
                              },
                              child: ListView.separated(
                                itemCount: state.listNotification!.length,
                                itemBuilder: (context, index) {
                                  return ItemNotification(
                                    message: state
                                            .listNotification?[index].message ??
                                        '',
                                    nameProduct: state.listNotification?[index]
                                            .nameProduct ??
                                        '',
                                    imageProduct: state.listNotification?[index]
                                            .imageProduct ??
                                        '',
                                    timeOrder: notificationCubit.formatTimeAgo(
                                        state.listNotification?[index]
                                                .timeOrder ??
                                            ''),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider();
                                },
                              ),
                            ),
                          )
                        else if (state.listNotification?.isEmpty ?? false)
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.imgNotificationError,
                                    ),
                                    const SizedBox(height: 10),
                                    const TextBold(
                                      text: "You don't have any notifications.",
                                      textSize: 16,
                                      color: 0xff000000,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if(state.notificationStatus == LoadStatus.loading)
                          const Expanded(child: Center(child: CircularProgressIndicator())),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
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