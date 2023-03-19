import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_cubit.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/build_another_person_message_item.dart';
import '../widgets/build_my_message_item.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/send_image_alert_dialog.dart';

class ChatScreenArgs {
  final String title;
  final String receiverId;
  final String receiverName;
  final String receiverImg;

  ChatScreenArgs({
    required this.title,
    required this.receiverId,
    required this.receiverName,
    required this.receiverImg,
  });
}

class ChatScreen extends StatefulWidget {
  final dynamic title;
  final dynamic receiverId;
  final dynamic receiverName;
  final dynamic receiverImg;

  const ChatScreen({Key? key,
    required this.title,
    required this.receiverId,
    this.receiverName,
    this.receiverImg})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  bool isTapped = false;

  @override
  void initState() {
    AuthCubit.get(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 18.sp),
        ),
        toolbarHeight: 60.h,
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 18.0.w),
            child: SvgPicture.asset(
              SvgPath.chatActionsAppBarIcon,
              height: 40.h,
              width: 40.w,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is GetProfilePickedImageSuccessState) {
            showDialog(
                context: context,
                builder: (context) =>
                    AddImageAlertDialog(
                        receiverId: widget.receiverId,
                        receiverName: widget.receiverName,
                        senderName:
                        AuthCubit
                            .get(context)
                            .getUserModel!
                            .fullName ?? '',
                        receiverImg: widget.receiverImg,
                        senderImg:
                        AuthCubit
                            .get(context)
                            .getUserModel!
                            .userImgUrl ?? ''));
          }
        },
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  itemBuilder: (BuildContext context, int index) {
                    if (cubit.messagesList[index].senderId == userId) {
                      return cubit.messagesList[index].messageType == 'text'
                          ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: MyMessageItem(
                          message: cubit.messagesList[index].messageText,
                          time: Jiffy(cubit.messagesList[index].dateTime).Hm,
                        ),
                      )
                          :imageContainer(alignment: Alignment.centerRight, imagePath: cubit.messagesList[index].image);
                    } else {
                      return cubit.messagesList[index].messageType == 'text'
                          ?Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: AnotherPersonMessageItem(
                            message: cubit.messagesList[index].messageText,
                            time: Jiffy(cubit.messagesList[index].dateTime).Hm,
                          )):imageContainer(alignment: Alignment.centerLeft, imagePath: cubit.messagesList[index].image);
                    }
                  },
                  itemCount: cubit.messagesList.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.sendMessage(
                                receiverId: widget.receiverId,
                                senderId: userId,
                                receiverName: "receiverName",
                                senderName: AuthCubit
                                    .get(context)
                                    .getUserModel!
                                    .fullName ??
                                    '',
                                receiverImg: null,
                                senderImg: AuthCubit
                                    .get(context)
                                    .getUserModel!
                                    .userImgUrl ??
                                    '',
                                text: chatController.text,
                                dateTime: DateTime.now().toString(),
                                orderId: "1",
                                image: null,
                                messageType: "text",
                                file: null,
                                lat: null,
                                lng: null);
                            chatController.clear();
                            isTapped = false;
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 24.r,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: ChatTextField(
                            pickImageFunction: () {
                              cubit.getImagePick();
                            },
                            controller: chatController,
                            isTapped: isTapped,
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget imageContainer({required Alignment alignment,required String imagePath}) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 300.h,
        width: 200.w,
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(
          color: AppColorsLightTheme.primaryColor,
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Image.network(imagePath,fit: BoxFit.cover,),
      ),
    );
  }
}
