import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/dio_helper.dart';

class VendorServicesRepository {
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
}
