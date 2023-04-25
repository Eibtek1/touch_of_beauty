class GetUserModel {
  String? email;
  String? fullName;
  String? phoneNumber;
  List<String>? role;
  int? userType;
  bool? isApproved;
  bool? phoneVerify;
  double? lat;
  double? lng;
  String? taxNumber;
  String? freelanceFormUrl;
  bool? status;
  String? userImgUrl;
  String? description;

  GetUserModel({
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
}
