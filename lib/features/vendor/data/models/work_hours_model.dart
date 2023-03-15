import 'package:equatable/equatable.dart';

class WorkHoursModel extends Equatable {
  final int? id;
  final int? day;
  final String? from;
  final String? to;
  final String? moreData;

  const WorkHoursModel({this.id, this.day, this.from, this.to, this.moreData});

  factory WorkHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkHoursModel(
      id: json['id'],
      day: json['day'],
      from: json['from'],
      to: json['to'],
      moreData: json['moreData'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        day,
        from,
        to,
        moreData,
      ];
}
