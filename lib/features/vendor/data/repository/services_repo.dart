import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/dio_helper.dart';

class VendorServicesRepository{
  static Future<Response> getFeaturedMainSections() async {
    final response = await DioHelper.getData(
        url: EndPoints.getFeaturedMainSections, bearerToken: token);
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
}