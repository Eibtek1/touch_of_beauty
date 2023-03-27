import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../widgets/home_screen_widgets/center_services_item.dart';

class FilteredServicesScreen extends StatefulWidget {
  const FilteredServicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FilteredServicesScreen> createState() => _FilteredServicesScreenState();
}

class _FilteredServicesScreenState extends State<FilteredServicesScreen> {
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'الخدمات',
            style: TextStyle(
                color: const Color(0xff263238),
                fontFamily: FontPath.almaraiBold,
                fontSize: 18.sp),
          ),
          toolbarHeight: 60.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<UserServicesCubit, UserServicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = UserServicesCubit.get(context);
            return Column(
              children: [
                Expanded(
                  child: state is! GetServicesByServiceProviderIdLoading
                      ? ListView.builder(
                          controller: scrollController,
                          itemCount: cubit.filteredServicesList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  cubit.getServicesDetailsByItsId(
                                      id: cubit
                                          .filteredServicesList[index].id!);
                                },
                                child: CenterServicesCategoryItem(
                                  servicesModel:
                                      cubit.filteredServicesList[index],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
