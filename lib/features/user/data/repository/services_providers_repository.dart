import 'package:dio/dio.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';

import '../../../../core/network/dio_helper.dart';

class ServicesProvidersRepository{


  static Future<Response> getAllServicesProviders() async {
    final response = await DioHelper.getData(url: EndPoints.getAllServicesProviders);
    return response;
  }


  static Future<Response> getAllFeaturedServicesProviders() async {
    final response = await DioHelper.getData(url: EndPoints.getAllFeaturedServicesProviders);
    return response;
  }


  static Future<Response> getServicesProviderById({
    required int id,
  }) async {
    final response = await DioHelper.getData(url: "${EndPoints.getServicesProviderById}$id");
    return response;
  }

}