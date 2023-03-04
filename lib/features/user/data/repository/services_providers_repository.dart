import 'package:dio/dio.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_helper.dart';

class ServicesProvidersRepository {
  static Future<Response> getAllServicesProviders(
      {required int pageNumber}) async {
    final response = await DioHelper.getData(
      url: EndPoints.getAllServicesProviders,
      bearerToken: token,
      query: {'PageNumber': pageNumber, 'PageSize': 15},
    );
    return response;
  }

  static Future<Response> getMainSections() async {
    final response = await DioHelper.getData(
        url: EndPoints.getMainSections, bearerToken: token);
    return response;
  }

  static Future<Response> getAllFeaturedServicesProviders(
      {required int pageNumber}) async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllFeaturedServicesProviders,
        query: {'PageNumber': pageNumber, 'PageSize': 10},
        bearerToken: token);
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
      url: "${EndPoints.getServicesProviderById}$id",
      bearerToken: token,
    );
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

  static Future<Response> addServicesProviderToFavorite(
      {required String id}) async {
    final response = await DioHelper.postData(
      url: "${EndPoints.addProviderToFavorite}$id",
      token: token,
    );
    return response;
  }

  static Future<Response> deleteServicesProviderFromFavorite(
      {required String id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.deleteProviderFromFavorite}$id",
      token: token,
    );
    return response;
  }

  static Future<Response> addServiceToFavorite({required int id}) async {
    final response = await DioHelper.postData(
      url: "${EndPoints.addServiceToFavorite}$id",
      token: token,
    );
    return response;
  }

  static Future<Response> deleteServiceFromFavorite({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.deleteServiceFromFavorite}$id",
      token: token,
    );
    return response;
  }



  static Future<Response> deleteAddress({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.addresses}/$id",
      token: token,
    );
    return response;
  }


  static Future<Response> addAddress({
    required int cityId,
    required String?region,
    required String? street,
    required String? buildingNumber,
    required String? flatNumber,
    required String? addressDetails,
  }) async {
    final response = await DioHelper.postData(
        url: EndPoints.addresses,
        token: token,
        data: {
          "region": region??"",
          "street": street??"",
          "buildingNumber": buildingNumber??"",
          "flatNumber": flatNumber??"",
          "addressDetails": addressDetails??"",
          "cityId": cityId
        });
    return response;
  }


  static Future<Response> addOrder({
    required int serviceId,
    required int addressId,
    required DateTime dateTime,
    required bool inHome,
  }) async {
    final response = await DioHelper.postData(
        url: EndPoints.addOrder,
        token: token,
        data: {
          "startingOn": "$dateTime",
          "serviceId": serviceId,
          "addressId": addressId,
          "inHome": inHome
        });
    return response;
  }



  static Future<Response> getAddress() async {
    final response = await DioHelper.getData(
        url: EndPoints.addresses, bearerToken: token);
    return response;
  }

  static Future<Response> getServicesDetailsById({
    required int id,
  }) async {
    final response = await DioHelper.getData(
      url: "${EndPoints.getServiceDetailsById}$id",
      bearerToken: token,
    );
    return response;
  }

}
