import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:touch_of_beauty/features/user/data/models/questions_model.dart';

class QuestionsWidget extends StatelessWidget {
  final QuestionsModel questionsModel;
  const QuestionsWidget({Key? key, required this.questionsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HtmlWidget(questionsModel.question!),
        SizedBox(height: 10.h,),
        HtmlWidget(questionsModel.answer!),
      ],
    );
  }
}
