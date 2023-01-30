import 'package:dio/dio.dart';
import 'api_end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {
        required String url, Map<String, dynamic>? query, String lang = 'en' , String? token
      }) async {
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang' : '',
      'Accept' : 'text/plain'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {
        required String url ,
        dynamic query ,
        dynamic data ,
        String lang = 'en' , String? token ,
      }
      )
  async{
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang' : '',
      'Accept' : 'text/plain'
    };
    return await dio.post(
        url, queryParameters: query,
        data:data);
  }


  static Future<Response> putData(
      {
        required String url , Map<String, dynamic>? query , required Map<String, dynamic>? data , String lang = 'en' , String? token ,
      }
      )
  async{
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang' : '',
      'Accept' : 'text/plain'
    };
    return await dio.put(
        url, queryParameters: query,
        data:{});
  }
}