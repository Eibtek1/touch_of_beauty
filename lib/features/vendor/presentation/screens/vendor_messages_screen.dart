import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/images_path.dart';

class VendorMessagesScreen extends StatelessWidget {
  VendorMessagesScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.gallery1, 'title': "سارة"},
    {'image': ImagePath.gallery2, 'title': "فاتن"},
    {'image': ImagePath.gallery3, 'title': "هند"},
    {'image': ImagePath.gallery4, 'title': "هدي"},
    {'image': ImagePath.gallery5, 'title': "حنان"},
    {'image': ImagePath.gallery6, 'title': "هاله"},
    {'image': ImagePath.gallery7, 'title': "اميره"},
    {'image': ImagePath.gallery8, 'title': "سعاد"},
    {'image': ImagePath.gallery10, 'title': "هدي"},
    {'image': ImagePath.gallery11, 'title': "فاتن"},
    {'image': ImagePath.gallery12, 'title': "حنان"},
    {'image': ImagePath.gallery13, 'title': "حنان"},
  ];

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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {return buildChatItem(image: itemsList[index]['image'], name: itemsList[index]['title']);},itemCount: itemsList.length,
      ),
    );
  }

  Widget buildChatItem({required String image, required String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w,vertical: 11.h),
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
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w,),
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
