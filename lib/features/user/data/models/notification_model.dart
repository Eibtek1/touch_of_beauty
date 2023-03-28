import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final String? createdOn;

  const NotificationModel({this.id, this.title, this.body, this.createdOn});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdOn: json['createdOn'],
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
