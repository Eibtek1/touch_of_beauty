import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/dio_helper.dart';

class AuthRepository{
  
  static Future<Response> userRegister({
    required String userName,
    required String password,
    required String email,
    required String phone,
    required int lat,
    required int lng,
    required int cityId,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.userRegister,
      data: FormData.fromMap({
        "fullName": userName,
        "email": email,
        "phoneNumber": phone,
        "password": password,
        "confirmPassword": password,
        "lat": lat,
        "lng": lng,
        "cityId": cityId,
        "img": image != null
            ? await MultipartFile.fromFile(image.path, filename: path.basename(image.path))
            : null
      }),
    );
    return response;
  }


  static Future<Response> vendorRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
    required int lat,
    required int lng,
    required int cityId,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.userRegister,
      data: FormData.fromMap({
        "fullName": userName,
        "email": email,
        "phoneNumber": phone,
        "description": description,
        "password": password,
        "confirmPassword": password,
        "lat": lat,
        "lng": lng,
        "cityId": cityId,
        "img": image != null
            ? await MultipartFile.fromFile(image.path, filename: path.basename(image.path))
            : null,
      }),
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
      data: FormData.fromMap({
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
            ? await MultipartFile.fromFile(freelancerImage.path, filename: path.basename(freelancerImage.path))
            : null,
        "img": image != null
            ? await MultipartFile.fromFile(image.path, filename: path.basename(image.path))
            : null,
      }),
    );
    return response;
  }
}