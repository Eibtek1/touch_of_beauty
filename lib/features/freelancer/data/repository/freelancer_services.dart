import 'package:dio/dio.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/constants/constants.dart';
import 'dart:io';
class FreelancerServicesRepository {
  static Future<Response> getMainSections() async {
    final response = await DioHelper.getData(
        url: EndPoints.getMainSections, bearerToken: token);
    return response;
  }

  static Future<Response> getServicesByServiceProviderId({
    required int pageNumber,
  }) async {
    final response = await DioHelper.getData(
        url: EndPoints.getServicesForServicesProvider,
        query: {'PageNumber': pageNumber, 'PageSize': 30},
        bearerToken: token);
    return response;
  }

  static Future<Response> addServices({
    required String titleAr,
    required String titleEn,
    required String description,
    required String duration,
    required File? image,
    required double price,
    required double finalPrice,
    required int empNumber,
    required int mainSectionId,
    required bool inHome,
    required bool inCenter,
    required bool isAvailable,
  }) async {
    final response = await DioHelper.postData(
        url: EndPoints.addService,
        token: token,
        data: FormData.fromMap({
          'Description':description,
          'Duration':duration,
          'FinalPrice':finalPrice,
          'Price':price,
          'InCenter':inCenter,
          'InHome':inHome,
          'IsAvailable':isAvailable,
          'MainSectionId':mainSectionId,
          'PriceUnit':1,
          'TitleAr':titleAr,
          'TitleEn':titleEn,
          'EmployeesNumber':empNumber,
          'Img':image != null
              ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
              : null,

        })
    );
    return response;
  }



  static Future<Response> deleteEmployee({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.employees}/$id",
      token: token,
    );
    return response;
  }


  static Future<Response> addEmployee({
    required String name,
    required String email,
    required String phoneNumber,
    required File? image,
  }) async {
    final response = await DioHelper.postData(
        url: EndPoints.employees,
        token: token,
        data: {
          "fullName": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "imgUrl":  image != null
              ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
              : "",
        });
    return response;
  }



  static Future<Response> getEmployees() async {
    final response = await DioHelper.getData(
        url: EndPoints.employees, bearerToken: token);
    return response;
  }
}
