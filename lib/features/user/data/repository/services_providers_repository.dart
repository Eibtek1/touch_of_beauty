import 'package:dio/dio.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_helper.dart';

class ServicesProvidersRepository {
  static Future<Response> getAllServicesProviders() async {
    final response = await DioHelper.getData(
      url: EndPoints.getAllServicesProviders,
      bearerToken: null,
      query: {'PageNumber': 1, 'PageSize': 10},
    );
    return response;
  }

  static Future<Response> getAllFeaturedServicesProviders() async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllFeaturedServicesProviders,
        query: {'PageNumber': 1, 'PageSize': 10},
        bearerToken: null);
    return response;
  }

  static Future<Response> getServicesInHomeOrInCenter({
    required bool inHome,
  }) async {
    final response = await DioHelper.getData(
        url: EndPoints.getServicesInHomeOrInCenter(inHome: inHome),
        query: {'PageNumber': 1, 'PageSize': 10},
        bearerToken: token);
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

  static Future<Response> getSliderPhotos() async {
    final response =
        await DioHelper.getData(url: EndPoints.slidePhotos, bearerToken: token);
    return response;
  }

  static Future<Response> getServicesProviderById({
    required String id,
  }) async {
    final response = await DioHelper.getData(
        url: "${EndPoints.getServicesProviderById}$id", bearerToken: token,);
    return response;
  }

  static Future<Response> getFeaturedMainSections() async {
    final response = await DioHelper.getData(
        url: EndPoints.getFeaturedMainSections, bearerToken: token);
    return response;
  }

  static Future<Response> getServicesByMainFeatureId({required int id}) async {
    final response = await DioHelper.getData(
        url: "${EndPoints.getServicesByMainFeatureId}$id", bearerToken: token);
    return response;
  }

  static Future<Response> getServices({
     int? pageNumber,
     int? pageSize,
     int? cityId,
     int? mainSectionId,
     int? serviceTypeDto,
     int? maxPrice,
     int? minPrice,
     String? servicesProviderName,
     String? servicesProviderId,
     String? searchName,
     bool? inHome,
     bool? inCenter,
     bool? orderFromNew,
  }) async {
    final response = await DioHelper.getData(
        url: EndPoints.getServicesForUser,
        bearerToken: token,
        query: {
          'PageNumber': pageNumber,
          'PageSize': pageSize,
          'ServiceProviderName': servicesProviderName,
          'ServiceProviderId': servicesProviderId,
          'SearchName': searchName,
          'CityId': cityId,
          'MainSectionId': mainSectionId,
          'InHome': inHome,
          'InCenter': inCenter,
          'ServiceTypeDto': serviceTypeDto,
          'OrderFromNew': orderFromNew,
          'StartPrice': minPrice,
          'EndPrice': maxPrice,
        });
    return response;
  }
}
