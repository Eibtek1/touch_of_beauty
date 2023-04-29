import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_state.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/notification_widget/notification_item_builder.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({Key? key}) : super(key: key);

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  void initState() {
    MainCubit.get(context).getAllNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 70.h,
            centerTitle: true,
            title: Text(
              LocaleKeys.notification.tr(),
              style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff1E2432)),
            ),
          ),
          body: state is! GetNotificationLoading? ListView.builder(
            itemCount: cubit.notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              return NotificationItemBuilder(
                notificationModel: cubit.notificationList[index],
              );
            },
          ):const Center(child: CircularProgressIndicator.adaptive(),),
        );
      },
    );
  }
}
