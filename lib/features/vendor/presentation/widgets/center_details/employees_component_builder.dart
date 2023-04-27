import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/employees_cubit/employees_cubit.dart';
import '../../../buisness_logic/employees_cubit/employees_state.dart';
import 'employee_alert_dialog.dart';

class EmployeesComponentBuilder extends StatelessWidget {
  const EmployeesComponentBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeesCubit, EmployeesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = EmployeesCubit.get(context);
        return SizedBox(
          height: 120.h,
          // width: 100.w,
          child: cubit.employeesList.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.employeesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 71.h,
                                    width: 71.w,
                                    clipBehavior: Clip.antiAlias,
                                    padding: EdgeInsets.all(3.r),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColorsLightTheme
                                                .primaryColor,
                                            width: 0.9.w),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      height: 61.h,
                                      width: 61.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            '${EndPoints.imageBaseUrl}${cubit.employeesList[index].imgUrl}',
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[400]!,
                                          highlightColor: Colors.grey[300]!,
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    // Image.network(
                                    //     cubit.employeesList[index].),
                                  ),
                                  Container(
                                    height: 71.h,
                                    width: 71.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    cubit.deleteEmployee(id: cubit.employeesList[index].id!);
                                  }, icon: Icon(Icons.delete,color: Colors.white,size: 25.r,)),
                                ],
                              ),
                              Expanded(
                                child: Text(
                                  cubit.employeesList[index].fullName!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: FontPath.almaraiBold,
                                    color: const Color(0xff1E2432),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index == cubit.employeesList.length - 1)
                          addEmployeeWidget(onTao: () {
                            showDialog(
                              context: context,
                              builder: (context) => const EmployeeAlertDialog(),
                            );
                          }),
                      ],
                    );
                  },
                )
              : addEmployeeWidget(onTao: () {
                  showDialog(
                    context: context,
                    builder: (context) => const EmployeeAlertDialog(),
                  );
                }),
        );
      },
    );
  }

  Widget addEmployeeWidget({required void Function()? onTao}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: onTao,
            child: Container(
              height: 68.h,
              width: 68.w,
              padding: EdgeInsets.all(10.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 8.r,
                    )
                  ],
                  color: Colors.white),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColorsLightTheme.primaryColor,
                  size: 28.r,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            LocaleKeys.add_emp.tr(),
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: FontPath.almaraiBold,
              color: const Color(0xff1E2432),
            ),
          ),
        ],
      ),
    );
  }
}
