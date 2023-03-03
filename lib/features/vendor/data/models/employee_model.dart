import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? imgUrl;

  const EmployeeModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.imgUrl,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      imgUrl: json['imgUrl'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fullName,
        phoneNumber,
        imgUrl,
      ];
}
