import 'package:dio/dio.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';
import 'package:touch_of_beauty/core/network/dio_helper.dart';

class UserRepository {
  static Future<Response> sendComplains({
    required String title,
    required String data,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.sendComplain,
      data: {
        'data': data,
        'title': title,
      },
    );
    return response;
  }
}
