import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/notification/widget/item_notification.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/notification/notification_cubit.dart';

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
    return RefreshIndicator(
      onRefresh: () async {
        notificationCubit
            .getListNotification(appCubit.state.userEntity!.id ?? 0);
      },
      child: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.88,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        buildWhen: (previous, current) =>
            previous.notificationStatus != current.notificationStatus,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Notification',
                      style: AppTextStyle.black18Bold,
                    ),
                  ),
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
              if (state.notificationStatus == LoadStatus.success &&
                  state.listNotification!.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    itemCount: state.listNotification!.length,
                    itemBuilder: (context, index) {
                      return ItemNotification(
                        message: state.listNotification?[index].message ?? '',
                        nameProduct:
                            state.listNotification?[index].nameProduct ?? '',
                        imageProduct:
                            state.listNotification?[index].imageProduct ?? '',
                        timeOrder: notificationCubit.formatTimeAgo(
                            state.listNotification?[index].timeOrder ?? ''),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                )
              else if (state.listNotification?.isEmpty ?? false)
                _emptyNotify(),
              if (state.notificationStatus == LoadStatus.loading)
                const Expanded(
                    child: Center(child: CircularProgressIndicator())),
            ],
          );
        },
      ),
    );
  }

  Widget _emptyNotify() {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.imgNotificationError,
              ),
              const SizedBox(height: 10),
              Text(
                "You don't have any notifications.",
                style: AppTextStyle.black16Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    notificationCubit.close();
    super.dispose();
  }
}
