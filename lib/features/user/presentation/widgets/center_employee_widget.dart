import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../vendor/buisness_logic/employees_cubit/employees_cubit.dart';
import '../../../vendor/buisness_logic/employees_cubit/employees_state.dart';

class EmployeesComponentBuilderForUser extends StatelessWidget {
  const EmployeesComponentBuilderForUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeesCubit, EmployeesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = EmployeesCubit.get(context);
        return SizedBox(
          height: 120.h,
          // width: 100.w,
          child: state is! GetEmployeeLoading
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.employeesListForUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Container(
                            height: 71.h,
                            width: 71.w,
                            clipBehavior: Clip.antiAlias,
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColorsLightTheme.primaryColor,
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
                                    '${EndPoints.imageBaseUrl}${cubit.employeesListForUser[index].imgUrl}',
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
                            //     cubit.employeesListForUser[index].),
                          ),
                          Expanded(
                            child: Text(
                              cubit.employeesListForUser[index].fullName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }
}
