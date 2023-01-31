class RegisterModel {
  String? fullName;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  String? userImgUrl;

  RegisterModel(
      {this.fullName,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.userImgUrl});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
      userImgUrl: json['userImgUrl'],
    );
  }
}
