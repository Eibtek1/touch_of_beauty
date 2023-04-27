import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../../core/assets_path/font_path.dart';
import '../../../../../../core/assets_path/images_path.dart';
import '../../../../../../translations/locale_keys.g.dart';
import '../../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../../buisness_logic/services_cubit/services_state.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/home_screen_widgets/search_check_button_item.dart';
import 'add_address_screen.dart';

class ChooseAddressScreen extends StatefulWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAddressScreen> createState() => _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends State<ChooseAddressScreen> {
  @override
  void initState() {
    UserServicesCubit.get(context).getAddress();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<UserServicesCubit, UserServicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = UserServicesCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 28.r,
                        color: const Color(0xffB83561),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        LocaleKeys.choose_address.tr(),
                        style: TextStyle(
                            color: const Color(0xff263238),
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 16.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                   Expanded(
                        child: state is! GetAddressLoading?ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.addressList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SearchCheckButtonItem(
                                index: index,
                                currentIndex: cubit.addressModel != null
                                    ? cubit.addressModel!.currentIdx!
                                    : null,
                                title: cubit.addressList[index].region!,
                                onPressed: () {
                                  cubit.changeButtonState(onPressed: () {
                                    cubit.addressModel = cubit.addressList[index];
                                  });
                                },
                                onChanged: (value) {
                                  cubit.changeButtonState(onPressed: () {
                                    cubit.addressModel = cubit.addressList[index];
                                  });
                                },
                              );
                            },
                          ):const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                      ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r)
                    ),
                    child: Image.asset(ImagePath.saudiMap,fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 45.h,
                    // width: 100.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColorsLightTheme.secondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50.r)
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, ScreenName.addAddressScreen,arguments: AddAddressArgs(addressModel: null, userEqualsZeroVendorEqualsOne: 1));
                      },
                      borderRadius: BorderRadius.circular(50.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 28.r,
                            color: const Color(0xffB83561),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            LocaleKeys.add_new_address.tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontPath.almaraiBold,
                                fontSize: 13.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomUserButton(
                      buttonTitle: LocaleKeys.choose.tr(),
                      isTapped: () {
                        Navigator.pop(context);
                      },
                      paddingVertical: 12.h,
                      paddingHorizontal: 45.w,
                      width: double.infinity),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
