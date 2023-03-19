import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/images_path.dart';
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
          'المحادثة',
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
                          arguments: ChatScreenArgs(title: chatItemsList[index]['name'], receiverId: chatItemsList[index]['id'], receiverName: '', receiverImg: ''));
                    },
                  );
                },
                child: buildChatItem(image: chatItemsList[index]['profileImage'], name: chatItemsList[index]['name']),
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
              child:image!=null? Image.network(
                image,
                fit: BoxFit.cover,
              ):Image.asset(ImagePath.gallery13,fit: BoxFit.cover,),
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
                  'سلام عليكم',
                  style: TextStyle(
                      color: const Color(0xff939FB5),
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 13.sp),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '22:30',
                  style: TextStyle(
                      color: const Color(0xff939FB5),
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 13.sp),
                ),
                const Icon(Icons.done_all)
              ],
            )
          ],
        ),
      ),
    );
  }
}
