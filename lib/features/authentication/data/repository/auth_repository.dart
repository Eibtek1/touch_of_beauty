import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/dio_helper.dart';

class AuthRepository{
  
  static Future<Response> userRegister({
    required String userName,
    required String password,
    required String email,
    required String phone,
    required int cityId,
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
        "cityId": cityId,
        "img": image != null
            ? imageToBase64(image.path)
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
    required int cityId,
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
        "description": description,
        "lat": 0,
        "lng": 0,
        "cityId": cityId,
        "img": image != null
            ? imageToBase64(image.path)
            : null,
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
    required int lat,
    required int lng,
    required int cityId,
    required File? freelancerImage,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.userRegister,
      data: {
        "fullName": userName,
        "email": email,
        "phoneNumber": phone,
        "description": description,
        "password": password,
        "confirmPassword": password,
        "lat": lat,
        "lng": lng,
        "cityId": cityId,
        "freelanceFormImg": freelancerImage != null
            ?  imageToBase64(freelancerImage.path)
            : null,
        "img": image != null
            ? imageToBase64(image.path)
            : null,
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
        "phoneNumber": phone
      },
    );
    return response;
  }


  static Future<Response> changeForgetPassword({
    required String phone,
    required String code,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.changeForgetPassword,
      data: {
        "phoneNumber": phone,
        "randomCode": code
      },
    );
    return response;
  }


  static Future<Response> getUserData() async {
    final response = await DioHelper.getData(
      url: EndPoints.getUserData,
    );
    return response;
  }
}