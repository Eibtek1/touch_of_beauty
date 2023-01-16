import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<String> imagesList = [
    ImagePath.cursolImage1,
    ImagePath.cursolImage2,
  ];

  List<Map<String, dynamic>> itemsList =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const Drawer(
        backgroundColor: AppColorsLightTheme.primaryColor,
      ),
      appBar: PreferredSize(
        preferredSize: Size(0,60.h),
        child: CustomAppbar(openDrawer: (){_scaffoldKey.currentState!.openDrawer();}, titleName: 'محمد'),
      ),
      body: Column(
        children: [
          SizedBox(height: 24.h,),
          CarouselSliderWidget(carouselItemsList: imagesList),
        ],
      ),
    );
  }

// Widget buildGridItem(CategoriesModel getCategoryModel) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         height: 89.h,
//         width: 89.w,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(0, 4.h),
//                   blurRadius: 6.r,
//                   color: AppColors.shadowColor)
//             ]),
//         child: CachedNetworkImage(
//           fit: BoxFit.cover,
//           imageUrl:
//           'https://t3halal.jaderplus.com/storage/app/${getCategoryModel.image}',
//           placeholder: (context,
//               url) =>
//               Shimmer
//                   .fromColors(
//                 baseColor: Colors
//                     .grey[400]!,
//                 highlightColor:
//                 Colors
//                     .grey[300]!,
//                 child: Container(
//                   height: double
//                       .infinity,
//                   width: double
//                       .infinity,
//                   decoration:
//                   BoxDecoration(
//                     color: Colors
//                         .black,
//                     borderRadius:
//                     BorderRadius
//                         .circular(
//                         8.0),
//                   ),
//                 ),
//               ),
//           errorWidget: (context,
//               url, error) =>
//           const Icon(
//               Icons.error),
//         ),
//       ),
//       SizedBox(
//         height: 10.h,
//       ),
//       Expanded(
//         child: Text(
//           getCategoryModel.title,
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: FontsPath.loewMedium,
//               color: AppColors.blackColor.withOpacity(0.9)),
//         ),
//       ),
//     ],
//   );
// }

}
