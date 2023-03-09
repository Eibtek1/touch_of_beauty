import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';

import '../../../../../../core/assets_path/font_path.dart';
import '../../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../../buisness_logic/services_cubit/services_state.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/home_screen_widgets/search_check_button_item.dart';

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
                        'قم بأختيار عنوانك',
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
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ScreenName.addAddressScreen);
                    },
                    child: Row(
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
                          'قم بأضافة عنوان جديد',
                          style: TextStyle(
                              color: const Color(0xff263238),
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomUserButton(
                      buttonTitle: 'اختيار',
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
