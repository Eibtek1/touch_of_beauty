import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/questions_widget.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class AllQuestionsScreen extends StatelessWidget {
  const AllQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 49.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                Expanded(
                  child: Text(
                    'الاسئلة الشائعة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                )
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Image.asset(
                ImagePath.authLogo,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<UserServicesCubit, UserServicesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = UserServicesCubit.get(context);
                return state is! GetAllQuestionsLoadingState
                    ? Expanded(
                      child: ListView.builder(
                        itemCount: cubit.questionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionsWidget(
                                questionsModel: cubit.questionsList[index]);
                          },
                        ),
                    )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
