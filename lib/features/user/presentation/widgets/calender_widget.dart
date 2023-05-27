import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';
import '../../../../core/app_theme/handel_errors.dart';
import '../../../../core/app_theme/text.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../vendor/buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import '../../../vendor/buisness_logic/work_hours_cubit/work_hours_state.dart';
import '../../buisness_logic/services_cubit/services_cubit.dart';

class SelectDate extends StatefulWidget {
  final String providerId;

  const SelectDate({
    super.key,
    required this.providerId,
  });

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  var date = DateTime.now();
  List<int> isAvaliable = [];
  int itemLength = 1;
  int selectedIndex = -1;
  DateTime? _selectedTime;
  DateTime? _chosenTime;
  late bool isLoading = false;

  @override
  void initState() {
    HandleError.toast.init(context);
    WorkHoursCubit.get(context)
        .getAvailableWorkHours(providerId: widget.providerId);
    super.initState();
  }

  isDae(BuildContext context, List<Widget> dayNumberWidgets,
      List<Widget> dayNameWidgets, int firstWeekday) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkHoursCubit, WorkHoursState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WorkHoursCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'اختر معاد الخدمة',
              style: TextStyle(
                  color: AppColorsLightTheme.primaryColor,
                  fontSize: 16.sp,
                  fontFamily: FontPath.almaraiBold),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: state is! GetAvailableWorkHoursLoading
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'برجاء اختيار موعد من المواعيد المتاحة لمفدم الخدمة',
                          style: TextStyle(
                              color: AppColorsLightTheme.primaryColor,
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiRegular),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          'يجب الالتزام بالموعد المختار',
                          style: TextStyle(
                              color: AppColorsLightTheme.searchScreenTextColor,
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold),),
                        TextApp.smallheightSpace(10),
                        Builder(builder: (
                          context,
                        ) {
                          if (cubit.availableWorkOursList.isEmpty) {
                            return SizedBox(
                              height: 330.h,
                              child: Center(
                                child: TextApp.customText(
                                    text: 'لا توجد مواعيد مسجلة لمقدم الخدمة',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: AppColorsLightTheme.primaryColor),
                              ),
                            );
                          }
                          else {
                            for (var data in cubit.availableWorkOursList) {
                              if (!DateTime.parse(data.moreData!)
                                  .isBefore(DateTime.now())) {
                                isAvaliable
                                    .add(DateTime.parse(data.moreData!).day);
                              }
                            }
                            List<Widget> dayNameWidgets = [
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ]
                                .map((dayName) => TextApp.customText(
                                text: dayName,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: AppColorsLightTheme.primaryColor))
                                .toList();
                            List<Widget> dayNumberWidgets = List.generate(
                                DateTime(DateTime.now().year,
                                    DateTime.now().month, 1)
                                    .weekday -
                                    1,
                                    (index) => const SizedBox());
                            dayNumberWidgets.addAll(
                              List.generate(
                                  DateTime(DateTime.now().year,
                                      DateTime.now().month + 1, 0)
                                      .day, (index) {
                                int dayOfMonth = index + 1;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isAvaliable.contains(dayOfMonth)) {
                                        selectedIndex = index;
                                        _selectedTime = DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            selectedIndex + 1);
                                        _chosenTime = _selectedTime;
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'غير متاح',
                                            backgroundColor: Colors.red);
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedIndex == index
                                            ? AppColorsLightTheme
                                            .secondaryColor
                                            : Colors.white),
                                    child: TextApp.customText(
                                        text: dayOfMonth.toString(),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color:
                                        isAvaliable.contains(dayOfMonth)
                                            ? selectedIndex == index
                                            ? Colors.white
                                            : Colors.black
                                            : Colors.grey),
                                  ),
                                );
                              }),
                            );
                            return Column(
                              children: [
                                Card(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            TextApp.customText(
                                                text: '${date.year}',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: AppColorsLightTheme
                                                    .primaryColor)
                                          ],
                                        ),
                                        TextApp.smallheightSpace(10),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            TextApp.customText(
                                                text: DateFormat('MMM')
                                                    .format(date),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.sp,
                                                color: AppColorsLightTheme
                                                    .primaryColor)
                                          ],
                                        ),
                                        TextApp.smallheightSpace(20),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: dayNameWidgets,
                                        ),
                                        TextApp.smallheightSpace(10),
                                        GridView.builder(
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: dayNumberWidgets.length,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 7,
                                              crossAxisSpacing: 10.w,
                                              mainAxisSpacing: 5.h,
                                              mainAxisExtent: 40),
                                          itemBuilder: (context, index) {
                                            return dayNumberWidgets[index];
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                TextApp.smallheightSpace(10),
                                Card(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    height: 172.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          00),
                                      maximumDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          24), // 3pm
                                      onDateTimeChanged:
                                          (DateTime newDateTime) {
                                        setState(() {
                                          _chosenTime = newDateTime
                                              .copyWith(day: selectedIndex+1);
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                        }),
                        TextApp.smallheightSpace(20),
                        CustomUserButton(
                            buttonTitle: LocaleKeys.choose.tr(),
                            isTapped: () {
                              if(_selectedTime != null){
                                print(_chosenTime);
                                print(_selectedTime);
                                UserServicesCubit.get(context).changeButtonState(onPressed: (){UserServicesCubit.get(context).dateTime =
                                    _chosenTime;});
                                Navigator.pop(context);

                              }else{
                                Fluttertoast.showToast(msg: 'اختر التاريخ',backgroundColor: Colors.red);
                              }
                              print(UserServicesCubit.get(context).dateTime);
                            },
                            width: double.infinity,
                            paddingVertical: 0,
                            paddingHorizontal: 0),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
