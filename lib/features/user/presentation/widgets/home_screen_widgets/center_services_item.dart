import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../screens/home_screen_screens/order_screens/reserve_order_screen.dart';

class CenterServicesCategoryItem extends StatelessWidget {
  final ServicesModel? servicesModel;

  const CenterServicesCategoryItem({Key? key, required this.servicesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        height: 160.h,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(0.29),
                offset: Offset(0, 3.h),
                blurRadius: 6.r)
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: 100.w,
                  child:  CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "${EndPoints.imageBaseUrl}${servicesModel!.imgUrl}",
                          placeholder: (context, url) => Shimmer.fromColors(
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
                        )
                ),
                Positioned(
                  top: 7.h,
                  left: 7.w,
                  child:BlocBuilder<UserServicesCubit, UserServicesState>(
                    builder: (context, state) {
                      var cubit = UserServicesCubit.get(context);
                      return InkWell(
                        onTap: (){
                          if(!cubit.favorites[servicesModel!.id!]!){
                            cubit.addServicesProviderToFavorite(id: servicesModel!.id!);
                          }
                          else if(cubit.favorites[servicesModel!.id!]!){
                            cubit.deleteServicesProviderToFavorite(id: servicesModel!.id!);
                          }
                        },
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(
                              cubit.favorites[servicesModel!.id!]!?Icons.favorite:Icons.favorite_border,
                              color: AppColorsLightTheme.secondaryColor,
                              size: 23.r,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      servicesModel != null
                          ? servicesModel!.title!
                          : 'النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    servicesModel != null
                        ? Row(
                            children: [
                              Text(
                                '${servicesModel!.finalPrice}  رس',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: const Color(0xffB83561),
                                ),
                              ),
                              SizedBox(
                                width: servicesModel!.finalPrice !=
                                        servicesModel!.price
                                    ? 76.w
                                    : 100.w,
                              ),
                              if (servicesModel!.finalPrice !=
                                  servicesModel!.price)
                                Container(
                                  width: 50.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      color: AppColorsLightTheme.primaryColor
                                          .withOpacity(0.3)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${(100 - (num.parse('${servicesModel!.finalPrice}') / num.parse('${servicesModel!.price}')) * 100).round()}% -',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontFamily: FontPath.almaraiRegular,
                                          color: const Color(0xff666666),
                                        ),
                                      ),
                                      Icon(
                                        Icons.local_offer_rounded,
                                        color: AppColorsLightTheme.primaryColor,
                                        size: 15.r,
                                      )
                                    ],
                                  ),
                                )
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                '${servicesModel!.price}  رس',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: const Color(0xffB83561),
                                ),
                              ),
                              SizedBox(
                                width: 76.w,
                              ),
                              Text(
                                'المدة 1ساعة',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: FontPath.almaraiBold,
                                  color: const Color(0xff666666),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: Text(
                        '${servicesModel!.description}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.2.h,
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ScreenName.reserveOrderScreen,arguments: ReserveOrderScreenArguments(servicesModel: servicesModel,));
                          },
                          icon: Icon(
                            Icons.add_circle_outlined,
                            size: 24.r,
                            color: AppColorsLightTheme.primaryColor,
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
