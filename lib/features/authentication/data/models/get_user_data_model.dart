import 'package:equatable/equatable.dart';

class GetUserModel extends Equatable{
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final List<String>? role;
  final int? userType;
  final bool? isApproved;
  final bool? phoneVerify;
  final double? lat;
  final double? lng;
  final String? taxNumber;
  final String? freelanceFormUrl;
  final bool? status;
  final String? userImgUrl;
  final String? description;

  const GetUserModel({
    this.email,
    this.fullName,
    this.phoneNumber,
    this.role,
    this.userType,
    this.isApproved,
    this.phoneVerify,
    this.lat,
    this.lng,
    this.taxNumber,
    this.freelanceFormUrl,
    this.status,
    this.userImgUrl,
    this.description,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
      email: json['email'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      role: json['role'].cast<String>(),
      userType: json['userType'],
      isApproved: json['isApproved'],
      phoneVerify: json['phoneVerify'],
      lat: json['lat'],
      lng: json['lng'],
      taxNumber: json['taxNumber'],
      freelanceFormUrl: json['freelanceFormUrl'],
      status: json['status'],
      userImgUrl: json['userImgUrl'],
      description: json['description'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    email,
    fullName,
    phoneNumber,
    role,
    userType,
    isApproved,
    phoneVerify,
    lat,
    lng,
    taxNumber,
    freelanceFormUrl,
    status,
    userImgUrl,
    description,
  ];
}
