import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../buisness_logic/reservation_cubit/reservation_state.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/complain_text_field.dart';

class ComplainsScreen extends StatefulWidget {
  const ComplainsScreen({Key? key}) : super(key: key);

  @override
  State<ComplainsScreen> createState() => _ComplainsScreenState();
}

class _ComplainsScreenState extends State<ComplainsScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تقديم شكوى',
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
      body: BlocConsumer<ReservationCubit, ReservationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomUserTextField(
                    hintText: 'عنوان الشكوي',
                    height: 44.h,
                    controller: titleController,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomUserTextField(
                    hintText: 'نص الشكوى',
                    height: 150.h,
                    controller: textController,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomUserButton(
                    buttonTitle: 'ارسال',
                    isTapped: () {},
                    width: double.infinity,
                    paddingVertical: 16.h,
                    paddingHorizontal: 45.w,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
