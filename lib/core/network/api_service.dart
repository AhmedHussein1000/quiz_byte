import 'package:dio/dio.dart';
import 'package:quiz_app/core/network/api_constants.dart';

class ApiService {
   final Dio dio;

  ApiService():dio =Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 40)));
 


   Future<Response> getData(
      {required String endpoint, required Map<String, dynamic> queryParameters}) async {
    
    return await dio.get(endpoint,
        queryParameters: queryParameters ,
        
        );
  }
}