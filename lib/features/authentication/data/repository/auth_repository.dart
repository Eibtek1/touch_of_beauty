import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/cache_manager/cache_keys.dart';
import '../../../../core/cache_manager/shared_preferences.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/dio_helper.dart';

class AuthRepository{
  
  static Future<Response> userRegister({
    required String userName,
    required String password,
    required String email,
    required String phone,
    required int? cityId,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.userRegister,
      data: {
        "fullName": userName,
        "email": email,
        "phoneNumber": phone,
        "password": password,
        "confirmPassword": password,
        "lat": 0,
        "lng": 0,
        "cityId": cityId??1,
        "img": image != null
            ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
            : null
      },
    );
    return response;
  }


  static Future<Response> vendorRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
    required String taxNumber,
    required int? cityId,
    required File? image,
  }) async {

    final response = await DioHelper.postData(
      url: EndPoints.centerRegister,
      data: {
        "confirmPassword": password,
        "description": description,
        "email": email,
        "fullName": userName,
        "img": image != null?"data:image/${image.path.split('.').last};base64,${imageToBase64(image)}":"",
        "password": password,
        "phoneNumber": phone,
        "taxNumber": taxNumber,
        "lat": "21.3666",
        "lng": "21.6588",
        "cityId": cityId
      },
    );
    return response;
  }

  static Future<Response> sendComplains({
    required String title,
    required String data,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.sendComplain,
      token: token,
      data: {
        'data': data,
        'title': title,
      },
    );
    return response;
  }

  static Future<Response> vendorUpdateProfile({
    required String? userName,
    required String? email,
    required String? description,
    required String? phone,
    required String? taxNumber,
    required File? image,
  }) async {

    final response = await DioHelper.putData(
      url: EndPoints.updateCenterProfile,
      token: token,
      data: {
        "description":description==""? "null null null":description,
        "email": email??"",
        "fullName": userName??"",
        "phoneNumber": phone,
        "taxNumber": taxNumber??"",
        "lat": "0.0",
        "lng":"0.0",
        "img": image != null?"data:image/${image.path.split('.').last};base64,${imageToBase64(image)}":"",
        // "imgFile": image != null?"data:image/${image.path.split('.').last};base64,${imageToBase64(image)}":""
      },
    );
    return response;
  }


  static Future<Response> freelancerUpdateProfile({
    required String? userName,
    required String? email,
    required String? description,
    required String? phone,
    required File? image,
  }) async {

    final response = await DioHelper.putData(
      url: EndPoints.updateFreelancerProfile,
      token: token,
      data: {
        "description": description==""? "null null null":description,
        "email": email??"",
        "phoneNumber": phone,
        "fullName": userName??"",
        "lat": "0.0",
        "lng": "0.0",
        "freelanceFormImg": "",
        "img": image != null?"data:image/${image.path.split('.').last};base64,${imageToBase64(image)}":"",
      },
    );
    return response;
  }


  static Future<Response> userUpdateProfile({
    required int cityId,
    required String email,
    required String name,
    required String phoneNumber,
    required File? image,
  }) async {

    final response = await DioHelper.putData(
      url: EndPoints.updateUserProfile,
      token: token,
      data:{
        "cityId": cityId,
        "email": email,
        "fullName": name,
        "phoneNumber": phoneNumber,
        "lat": 0.0,
        "lng": 0.0,
        "img": image != null?"data:image/${image.path.split('.').last};base64,${imageToBase64(image)}":"",
      },
    );
    return response;
  }


  static Future<Response> freelancerRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
    required int? cityId,
    required File? freelancerImage,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.freelancerRegister,
      data: {
        "fullName": userName,
        "email": email,
        "phoneNumber": phone,
        "description": description,
        "password": password,
        "confirmPassword": password,
        "lat": 0,
        "lng": 0,
        "cityId": cityId??1,
        "freelanceFormImg": freelancerImage != null
            ?  "data:image/${freelancerImage.path.split('.').last};base64,${imageToBase64(freelancerImage)}"
            : "",
        "img": image != null
            ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
            : "",
      },
    );
    return response;
  }


  static Future<Response> login({
    required String phone,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.login,
      data: {
        "phoneNumber": phone,
        "password": password,
        "deviceToken": "string",
        "isPersist": true
      },
    );
    return response;
  }


  static Future<Response> logout() async {
    final response = await DioHelper.postData(
      url: EndPoints.logout,
      token: token,
    );
    return response;
  }


  static Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.changePassword,
      data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword
      },
    );
    return response;
  }


  static Future<Response> forgetPassword({
    required String phone,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.forgetPassword,
      data: {
        "phoneNumber": phone,
      },
    );
    return response;
  }


  static Future<Response> confirmForgetPassword({
    required String phone,
    required String randomCode,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.changeConfirmPassword,
      data: {
        "phoneNumber": phone,
        "randomCode": randomCode
      },
    );
    return response;
  }


  static Future<Response> changeForgetPassword({
    required String password,
  }) async {
    print(token);
    final response = await DioHelper.putData(
      token: token,
      url: EndPoints.changeForgetPassword,
      data: {
        "password": password,
        "confirmPassword": password
      },
    );
    return response;
  }


  static Future<Response> confirmRegister({
    required String phone,
    required String randomCode,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.confirmRegister,
      data: {
        "phoneNumber": phone,
        "randomCode": randomCode
      },
    );
    return response;
  }


  static Future<Response> getUserData() async {
    final response = await DioHelper.getData(
      url: EndPoints.getUserData, bearerToken: token,
    );
    return response;
  }


  static Future<Response> getAllPicturesForProvider() async {
    final response = await DioHelper.getData(
      url: EndPoints.getAllPicturesForProvider, bearerToken: token,
    );
    return response;
  }


  static Future<Response> addPictureToLibrary({required File? image}) async {
    final response = await DioHelper.postData(
      url: EndPoints.addPictureToLibrary, token: token,data: {
      "photo": image != null
          ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
          : "",
    }
    );
    return response;
  }


  static Future<Response> deleteImage({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.addPictureToLibrary}$id", token: token,
    );
    return response;
  }
}