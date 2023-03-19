import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_cubit.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_state.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';

class AddImageAlertDialog extends StatelessWidget {
  final String receiverId;
  final String receiverName;
  final String senderName;
  final String receiverImg;
  final String senderImg;
  const AddImageAlertDialog({
    Key? key, required this.receiverId, required this.receiverName, required this.senderName, required this.receiverImg, required this.senderImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 200.h,
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {

            if(state is SendImageSuccessState){
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = ChatCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  padding: EdgeInsets.all(10.r),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: AppColorsLightTheme.primaryColor),
                      borderRadius: BorderRadius.circular(2.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 8.r,
                        )
                      ],
                      color: Colors.white),
                  child: cubit.profileImage != null
                      ? Image.file(
                    cubit.profileImage!,
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                SizedBox(height: 20.h,),
                state is! SendImageLoadingState
                    ? CustomVendorButton(
                    buttonTitle: 'ارسال الصورة',
                    isTapped: () {
                      cubit.uploadPhotoToFirebase(receiverId: receiverId, receiverName: receiverName, senderName: senderName, receiverImg: receiverImg, senderImg: senderImg, dateTime: DateTime.now().toString());
                    },
                    width: double.infinity,
                    paddingVertical: 12.h,
                    paddingHorizontal: 45.w)
                    : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
