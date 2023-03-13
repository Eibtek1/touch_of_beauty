class LoginModel {
  String? email;
  String? fullName;
  String? userId;
  String? token;
  List<String>? role;
  String? userImgUrl;
  String? phoneNumber;
  String? description;
  int? userType;

  LoginModel(
      {this.email,
      this.fullName,
      this.token,
      this.role,
      this.userImgUrl,
      this.userId,
      this.phoneNumber,
      this.description,
      this.userType});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      userId: json['userId'],
      fullName: json['fullName'],
      token: json['token'],
      role: json['role'].cast<String>(),
      userImgUrl: json['userImgUrl'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
      userType: json['userType'],
    );
  }
}
