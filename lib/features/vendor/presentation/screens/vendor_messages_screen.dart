import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../chat/buisness_logic/chat_cubit.dart';
import '../../../chat/presentation/screens/chat_screen.dart';

class VendorMessagesScreen extends StatelessWidget {
  const VendorMessagesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          LocaleKeys.chats.tr(),
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: FontPath.almaraiBold,
              color: const Color(0xff1E2432)),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("chats")
            .orderBy("dateTime")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Map<String, dynamic>> chatItemsList =
          snapshot.data!.docs.reversed.map((e) => e.data()).toList();
          return ListView.builder(
            itemCount: chatItemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  ChatCubit.get(context)
                      .getMessages(
                      receiverId: chatItemsList[index]['id'], senderId: userId)
                      .then(
                        (value) {
                      Navigator.pushNamed(
                          context, ScreenName.chatScreen,
                          arguments: ChatScreenArgs(title: chatItemsList[index]['name'], receiverId: chatItemsList[index]['id'], receiverName: '', receiverImg:chatItemsList[index]['receiverImg']??"", orderId: chatItemsList[index]['orderId']??''));
                    },
                  );
                },
                child: buildChatItem(image: "${EndPoints.imageBaseUrl}${chatItemsList[index]['profileImage']}", name: chatItemsList[index]['name']),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildChatItem({required String? image, required String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
        height: 75.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 16.r,
                color: Colors.black.withOpacity(0.14))
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52.h,
              width: 48.w,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child:CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                "${EndPoints.imageBaseUrl}$image",
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: const Color(0xff3C475C),
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 13.sp),
                ),
                Text(
                  'ادخل للدردشة',
                  style: TextStyle(
                      color: const Color(0xff939FB5),
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
