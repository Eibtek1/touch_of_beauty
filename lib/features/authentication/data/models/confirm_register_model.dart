class ConfirmRegisterModel {
  String? email;
  String? fullName;
  List<String>? role;
  String? userImgUrl;
  String? phoneNumber;

  ConfirmRegisterModel(
      {this.email,
        this.fullName,
        this.role,
        this.userImgUrl,
        this.phoneNumber});

  ConfirmRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    role = json['role'].cast<String>();
    userImgUrl = json['userImgUrl'];
    phoneNumber = json['phoneNumber'];
  }

}
