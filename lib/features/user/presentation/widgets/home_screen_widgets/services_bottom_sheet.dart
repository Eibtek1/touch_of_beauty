import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../data/models/services_model.dart';
import '../../screens/home_screen_screens/order_screens/reserve_order_screen.dart';

class ServicesBottomSheet extends StatelessWidget {
  final ServicesDetailsModel servicesModel;
  const ServicesBottomSheet({Key? key, required this.servicesModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: "${EndPoints.imageBaseUrl}${servicesModel.imgUrl}",
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
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            children: [
              Text(
                servicesModel.titleAr!,
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                    size: 15.r,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'مدة الخدمة 1 ساعة',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontFamily: FontPath.almaraiBold,
                      color: const Color(0xff666666),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text(
                    '${servicesModel.finalPrice}  رس',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xffB83561),
                    ),
                  ),
                  SizedBox(
                    width: servicesModel.finalPrice!=servicesModel.price?170.w:220.w,
                  ),
                  if(servicesModel.finalPrice!=servicesModel.price)Container(
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color:
                            AppColorsLightTheme.primaryColor.withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(100-(num.parse('${servicesModel.finalPrice}')/num.parse('${servicesModel.price}'))*100).round()}% -',
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
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'وصف الخدمة',
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                servicesModel.description!,
                style: TextStyle(
                  height: 1.2.h,
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff666666),
                ),
              ),
              // HtmlWidget(servicesModel.description!),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مقدم الخدمة',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ScreenName.allCentersScreen);
                    },
                    child: Text(
                      'عرض المزيد',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: AppColorsLightTheme.secondaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 87.h,
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
                    ]),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: 122.w,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: "${EndPoints.imageBaseUrl}${servicesModel.serviceProvider!.userImgUrl}",
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
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          top: 14.h,
                          left: 14.w,
                          child:BlocBuilder<ServicesProvidersCubit, ServicesProvidersState>(
                            builder: (context, state) {
                              var cubit = ServicesProvidersCubit.get(context);
                              return InkWell(
                                onTap: (){
                                  if(!cubit.favorites[servicesModel.serviceProvider!.id]!){
                                    cubit.addServicesProviderToFavorite(id: servicesModel.serviceProvider!.id!);
                                  }
                                  else if(cubit.favorites[servicesModel.serviceProvider!.id!]!){
                                    cubit.deleteServicesProviderToFavorite(id: servicesModel.serviceProvider!.id!);
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Icon(
                                      cubit.favorites[servicesModel.serviceProvider!.id!]!?Icons.favorite:Icons.favorite_border,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            servicesModel.serviceProvider!.fullName!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: FontPath.almaraiBold,
                                color: const Color(0xff1E2432)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Expanded(
                            child: Text(
                              '${servicesModel.serviceProvider!.addresses!.addressDetails}${servicesModel.serviceProvider!.addresses!.city}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff666666),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RatingBar.builder(
                            itemSize: 14.r,
                            ignoreGestures: true,
                            initialRating: servicesModel.serviceProvider!.numberOfStar!,
                            minRating: 1,
                            unratedColor: Colors.grey,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColorsLightTheme.secondaryColor,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomUserButton(
                  buttonTitle: 'اطلب الخدمة',
                  isTapped: () {
                    Navigator.pushNamed(context, ScreenName.reserveOrderScreen,arguments: ReserveOrderScreenArguments(servicesModel: servicesModel,isBottomSheet: true));
                  },
                  width: double.infinity,
                  paddingVertical: 16.h,
                  paddingHorizontal: 45.w),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}
