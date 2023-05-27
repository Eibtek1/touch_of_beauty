import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_state.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/services_bottom_sheet.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../chat/buisness_logic/chat_cubit.dart';
import '../../../../chat/presentation/screens/chat_screen.dart';
import '../../../data/models/services_providers_model.dart';
import 'center_services_item.dart';

class CenterDetailsBottomSheet extends StatefulWidget {
  final ServicesProviderModel servicesProvidersModel;

  const CenterDetailsBottomSheet(
      {Key? key, required this.servicesProvidersModel})
      : super(key: key);

  @override
  State<CenterDetailsBottomSheet> createState() =>
      _CenterDetailsBottomSheetState();
}

class _CenterDetailsBottomSheetState extends State<CenterDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 230.h,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r))),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "${EndPoints.imageBaseUrl}${widget.servicesProvidersModel.userImgUrl}",
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.servicesProvidersModel.title}",
                    style: TextStyle(
                        color: const Color(0xff263238),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp),
                  ),
                  BlocConsumer<ChatCubit, ChatState>(
                    listener: (context, state) {
                      if (state is GetMessageSuccess) {
                        if (ChatCubit.get(context).messagesList.isNotEmpty) {
                          Navigator.pushNamed(context, ScreenName.chatScreen,
                              arguments: ChatScreenArgs(
                                  title:
                                      '${widget.servicesProvidersModel.title}',
                                  receiverId:
                                      '${widget.servicesProvidersModel.id}',
                                  receiverName:
                                      '${widget.servicesProvidersModel.title}',
                                  receiverImg: '',
                                  orderId: ''));
                        } else {
                          initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale);
                          Fluttertoast.showToast(
                              msg:initialLocale == "ar"? 'لا يمكن الدخول للدردشة الا بعد طلب خدمة':"It is not possible to enter the chat except after requesting a service",backgroundColor: Colors.red);
                        }
                      }
                    },
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            ChatCubit.get(context).getMessages(
                                receiverId: widget.servicesProvidersModel.id,
                                senderId: userId);
                          },
                          icon: SvgPicture.asset(
                            SvgPath.chatIcon,
                            width: 50.w,
                            height: 50.h,
                          ));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                widget.servicesProvidersModel.addresses!.isNotEmpty
                    ? widget.servicesProvidersModel.addresses![0].city!
                    : LocaleKeys.no_address_added.tr(),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: FontPath.almaraiRegular,
                  color: const Color(0xff666666),
                ),
              ),
              if (widget.servicesProvidersModel.addresses != null &&
                  widget.servicesProvidersModel.addresses!.isNotEmpty)
                SizedBox(
                  height: 8.h,
                ),
              if (widget.servicesProvidersModel.addresses != null &&
                  widget.servicesProvidersModel.addresses!.isNotEmpty)
                Text(
                  widget.servicesProvidersModel.addresses!.isNotEmpty
                      ? widget
                          .servicesProvidersModel.addresses![0].addressDetails!
                      : LocaleKeys.no_address_added.tr(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: const Color(0xff666666),
                  ),
                ),
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColorsLightTheme.primaryColor,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        LocaleKeys.open_today.tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '10k ${LocaleKeys.view.tr()}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColorsLightTheme.secondaryColor,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${widget.servicesProvidersModel.numberOfStar}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
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
                LocaleKeys.services_discription.tr(),
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              // HtmlWidget(widget.servicesProvidersModel.description!),
              Text(
                widget.servicesProvidersModel.description!,
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff666666),
                ),
              ),
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
                    LocaleKeys.working_hours.tr(),
                    style: TextStyle(
                        color: const Color(0xff263238),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 21.h,
                    width: 52.w,
                  )
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              widget.servicesProvidersModel.workDays!.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.servicesProvidersModel.workDays!.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(widget
                            .servicesProvidersModel.workDays![index].moreData!);
                        int day =
                            widget.servicesProvidersModel.workDays![index].day!;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: availableTimeWidget(
                            title: "${DateFormat('EEEE',initialLocale).format(DateTime.parse(widget
                                .servicesProvidersModel.workDays![index].moreData!))} ${DateFormat('yMMMd',initialLocale).format(DateTime.parse(widget
                                .servicesProvidersModel.workDays![index].moreData!))}",
                            from: widget
                                .servicesProvidersModel.workDays![index].from!
                                .substring(0, 4),
                            to: widget
                                .servicesProvidersModel.workDays![index].to!
                                .substring(0, 4),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        LocaleKeys.working_hours_not_yet.tr(),
                        style: TextStyle(
                            color: AppColorsLightTheme.primaryColor,
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 16.sp),
                      ),
                    ),
              SizedBox(
                height: 22.h,
              ),
              const Divider(),
              SizedBox(
                height: 22.h,
              ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                Text(
                  LocaleKeys.our_services.tr(),
                  style: TextStyle(
                      color: const Color(0xff263238),
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 18.sp),
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                SizedBox(
                  height: 10.h,
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                BlocConsumer<UserServicesCubit, UserServicesState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = UserServicesCubit.get(context);
                    return SizedBox(
                      height: 30.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount:
                            widget.servicesProvidersModel.mainSection!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: cubit.tabBarCIndex == index
                                  ? AppColorsLightTheme.secondaryColor
                                      .withOpacity(0.2)
                                  : AppColorsLightTheme.authTextFieldFillColor,
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.w, vertical: 1.h),
                            ),
                            onPressed: () {
                              if (index != cubit.tabBarCIndex) {
                                cubit.changeTabBarCurrentIndex(index,
                                    servicesProviderId:
                                        widget.servicesProvidersModel.id!,
                                    mainSectionId: widget.servicesProvidersModel
                                        .mainSection![index].mainSectionId!);
                              }
                            },
                            child: Text(
                              widget.servicesProvidersModel.mainSection![index]
                                  .titele!,
                              style: TextStyle(
                                  color: cubit.tabBarCIndex == index
                                      ? Colors.pink
                                      : Colors.grey,
                                  fontFamily: FontPath.almaraiBold,
                                  fontSize: 12.sp),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                SizedBox(
                  height: 10.h,
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                BlocConsumer<UserServicesCubit, UserServicesState>(
                  listener: (context, state) {
                    var cubit = UserServicesCubit.get(context);
                    if (state
                            is GetServicesDetailsInCentersBottomSheetByItsIdSuccess &&
                        cubit.servicesModel != null) {
                      Navigator.pop(context);
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return ServicesBottomSheet(
                              servicesModel: cubit.servicesModel!);
                        },
                      );
                    }
                    if (state
                        is GetServicesDetailsInCentersBottomSheetByItsIdLoadingState) {
                      showProgressIndicator(context);
                    }
                  },
                  builder: (context, state) {
                    var cubit = UserServicesCubit.get(context);
                    return !cubit
                            .getServicesByMainSectionAndServicesProvidersIdLoading
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  cubit.getServicesDetailsInCentersBottomSheetByItsId(
                                      id: cubit
                                          .servicesByMainSectionAndServicesProviderList[
                                              index]
                                          .id!);
                                  print(cubit
                                      .servicesByMainSectionAndServicesProviderList[
                                  index]
                                      .id!);
                                },
                                child: CenterServicesCategoryItem(
                                  servicesModel: cubit
                                          .servicesByMainSectionAndServicesProviderList[
                                      index],
                                ),
                              );
                            },
                            itemCount: cubit
                                .servicesByMainSectionAndServicesProviderList
                                .length,
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                  },
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                SizedBox(
                  height: 22.h,
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                const Divider(),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                SizedBox(
                  height: 22.h,
                ),
              if (widget.servicesProvidersModel.mainSection != null &&
                  widget.servicesProvidersModel.mainSection!.isNotEmpty)
                OutlinedButton(
                  onPressed: () {
                    UserServicesCubit.get(context).servicesPageNumber = 1;
                    UserServicesCubit.get(context)
                        .getServicesByServiceProviderId(
                            servicesProviderId:
                                widget.servicesProvidersModel.id);
                    Navigator.pushNamed(context, ScreenName.ourServicesScreen,
                        arguments: widget.servicesProvidersModel.id);
                  },
                  style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      side: BorderSide(
                          width: 1.5.w,
                          color: AppColorsLightTheme.primaryColor)),
                  child: Text(
                    LocaleKeys.watch_our_services.tr(),
                    style: TextStyle(
                        color: AppColorsLightTheme.primaryColor,
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 16.sp),
                  ),
                ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.gallery.tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ScreenName.galleryScreen,
                          arguments:
                              widget.servicesProvidersModel.picturesLibrary!);
                    },
                    child: Text(
                      LocaleKeys.watch_all.tr(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: AppColorsLightTheme.secondaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Container(
                        height: 76.h,
                        width: 76.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "${EndPoints.imageBaseUrl}${widget.servicesProvidersModel.picturesLibrary![index].imgUrl!}",
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
                        ),
                      ),
                    );
                  },
                  itemCount:
                      widget.servicesProvidersModel.picturesLibrary!.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget availableTimeWidget(
      {required String title, required String from, required String to}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 16.sp),
        ),
        Container(
          height: 24.h,
          width: 81.w,
          decoration: BoxDecoration(
            color: const Color(0xffF0F3F6),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              '$to - $from',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: FontPath.almaraiRegular,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
