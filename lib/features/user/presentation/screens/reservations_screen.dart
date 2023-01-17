import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_state.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/images_path.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.babyCare, 'title': "العناية بالطفل"},
    {'image': ImagePath.beautyCenter, 'title': "فسم التجميل"},
    {'image': ImagePath.hairCare, 'title': "العناية بالشعر"},
    {'image': ImagePath.makeup, 'title': "فسم المكياج"},
    {'image': ImagePath.naturalTherapy, 'title': "العلاج الطبيعي"},
    {
      'image': ImagePath.photography,
      'title': "التصــــــــــــوير الفوتوغرافي"
    },
    {'image': ImagePath.selfCare, 'title': "العناية الشخصية"},
    {'image': ImagePath.skinCare, 'title': "العناية بالبشرة"},
  ];

  List<String> titles = [
    'كل الطلبات',
    'المطلوبة',
    'المنتهية',
  ];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    ReservationCubit.get(context).tabBarCIndex = 0;
    tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReservationCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('حجزاتي',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432))),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    tabs: List.generate(
                      titles.length,
                      (index) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cubit.tabBarCIndex == index
                              ? Colors.grey
                              : Colors.purple,
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 12.h),
                        ),
                        onPressed: () {
                          tabController!.animateTo(index);
                          cubit.changeTabBarCurrentIndex(index);
                        },
                        child: Text(
                          titles[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                          itemCount: itemsList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) => GridItemBuilder(
                                model: itemsList[index],
                              )),
                      GridView.builder(
                          itemCount: itemsList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) => GridItemBuilder(
                                model: itemsList[index],
                              )),
                      GridView.builder(
                        itemCount: itemsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) => GridItemBuilder(
                          model: itemsList[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
