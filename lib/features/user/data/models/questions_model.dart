import 'package:equatable/equatable.dart';

class QuestionsModel extends Equatable {
  final int? id;
  final String? question;
  final String? answer;
  final String? section;

  const QuestionsModel({this.id, this.question, this.answer, this.section});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      section: json['section'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        question,
        answer,
        section,
      ];
}
