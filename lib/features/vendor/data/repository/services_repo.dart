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
    required int? empNumber,
    required int mainSectionId,
    required bool inHome,
    required bool inCenter,
    required bool isAvailable,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.addService,
      token: token,
      data: FormData.fromMap({
        'Description': description,
        'Duration': duration,
        'FinalPrice': finalPrice,
        'Price': price,
        'InCenter': inCenter,
        'InHome': inHome,
        'IsAvailable': true,
        'MainSectionId': mainSectionId,
        'PriceUnit': 1,
        'TitleAr': titleAr,
        'TitleEn': titleEn,
        'EmployeesNumber': empNumber,
        'Img': image != null
            ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
            : null,
      }),
    );
    return response;
  }

  static Future<Response> updateServices({
    required String titleAr,
    required String titleEn,
    required String description,
    required String? duration,
    required File? image,
    required double price,
    required double finalPrice,
    required int? empNumber,
    required int mainSectionId,
    required bool inHome,
    required bool inCenter,
    required bool isAvailable,
    required int id,
  }) async {
    final response = await DioHelper.putData(
        url: "${EndPoints.editServices}$id",
        token: token,
        data: FormData.fromMap({
          'Description': description,
          'Duration': duration,
          'FinalPrice': finalPrice,
          'Price': price,
          'InCenter': inCenter,
          'InHome': inHome,
          'IsAvailable': isAvailable,
          'MainSectionId': mainSectionId,
          'PriceUnit': 1,
          'TitleAr': titleAr,
          'TitleEn': titleEn,
          'EmployeesNumber': empNumber,
          'Img': image != null
              ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
              : null,
        }));
    return response;
  }

  static Future<Response> deleteEmployee({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.employees}/$id",
      token: token,
    );
    return response;
  }

  static Future<Response> deleteServices({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.deleteServices}$id",
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
    final response =
        await DioHelper.postData(url: EndPoints.employees, token: token, data: {
      "fullName": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "imgUrl": image != null
          ? "data:image/${image.path.split('.').last};base64,${imageToBase64(image)}"
          : "",
    });
    return response;
  }

  static Future<Response> getEmployees() async {
    final response =
        await DioHelper.getData(url: EndPoints.employees, bearerToken: token);
    return response;
  }

  static Future<Response> getEmployeeForCenterToUser({required String providerId}) async {
    final response =
        await DioHelper.getData(url: EndPoints.employeesForCenterToUser, bearerToken: token,query: {
          'providerId':providerId
        });
    return response;
  }

  static Future<Response> getConfirmedOrders() async {
    final response = await DioHelper.getData(
      url: EndPoints.confirmedOrders,
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getWithDriverOrders() async {
    final response = await DioHelper.getData(
      url: EndPoints.withDriverOrders,
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getFinishedOrders() async {
    final response = await DioHelper.getData(
      url: EndPoints.finishedOrders,
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getCanceledOrders() async {
    final response = await DioHelper.getData(
      url: EndPoints.cancelledOrders,
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getPreparedOrders() async {
    final response = await DioHelper.getData(
      url: EndPoints.preparedOrders,
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getOrdersById({required int orderId}) async {
    final response = await DioHelper.getData(
      url: "${EndPoints.getOrderById}/$orderId",
      bearerToken: token,
    );
    return response;
  }

  static Future<Response> getTodayOrders({required bool inHome, required String startDate, required String endDate}) async {
    final response = await DioHelper.getData(
        url: EndPoints.getTodayOrders,
        bearerToken: token,
        query: {
          'InHome': inHome,
          'Start': startDate,
          // 'Start': DateTime.now().subtract(const Duration(days: 1)).toString(),
          'End': endDate,
          // 'End': DateTime.now().add(const Duration(days: 1)).toString(),
        });
    return response;
  }

  static Future<Response> changeOrderStatus({
    required int orderId,
    required int orderStatus,
  }) async {
    final response = await DioHelper.putData(
      url: "${EndPoints.changeOrderStatus}/$orderId/$orderStatus",
      token: token,
    );
    return response;
  }

  static Future<Response> getWorkHours() async {
    final response = await DioHelper.getData(
      url: EndPoints.workHours,
      bearerToken: token,
    );
    return response;
  }



  static Future<Response> getAvailableWorkHours({required String providerId}) async {
    final response = await DioHelper.getData(
        url: EndPoints.availableWorkHours,
        bearerToken: token,
        query: {
          "providerId":providerId,
        }
    );
    return response;
  }
  static Future<Response> addWorkHours({
    required int day,
    required DateTime from,
    required DateTime to,
    required DateTime moreData,
  }) async {
    print( "${from.toIso8601String()}z");
    print( "${to.toIso8601String()}z");
    final response =
        await DioHelper.postData(url: EndPoints.workHours, token: token, data: [{
      "day": day,
      'from': "${from.toIso8601String()}z",
      "to": "${to.toIso8601String()}z",
      "moreData": moreData.toIso8601String()
    }]);
    return response;
  }

  static Future<Response> updateWorkHours({
    required int day,
    required int id,
    required DateTime from,
    required DateTime to,
    required DateTime moreData,
  }) async {
    final response =
        await DioHelper.putData(url: EndPoints.workHours, token: token, data: {
      "id": id,
      "day": day,
      "from": from.toIso8601String(),
      "to": to.toIso8601String(),
      "moreData": moreData.toIso8601String(),
    });
    return response;
  }

  static Future<Response> deleteWorkHours({required int id}) async {
    final response = await DioHelper.deleteData(
      url: "${EndPoints.workHours}/$id",
      token: token,
    );
    return response;
  }
}
