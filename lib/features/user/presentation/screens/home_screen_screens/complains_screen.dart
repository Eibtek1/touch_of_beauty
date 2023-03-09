import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../../core/assets_path/font_path.dart';
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
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is SendCompLoading){
            showProgressIndicator(context);
          }if(state is SendCompSuccess){
            Navigator.pop(context);
            Fluttertoast.showToast(msg: 'تم ارسال الشكوي وسيتم مراجعتها');
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
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
                    isTapped: () {
                      if(titleController.text == ''&&titleController.text.isEmpty){
                        Fluttertoast.showToast(msg: 'يجب ادخال عنوان الشكوي');
                      }
                      else if(textController.text == ''&&textController.text.isEmpty){
                        Fluttertoast.showToast(msg: 'يجب نص عنوان الشكوي');
                      }
                      else{
                        cubit.sendComplaint(title: titleController.text, data: textController.text);
                      }
                    },
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
