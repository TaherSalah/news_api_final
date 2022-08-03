import 'package:dio/dio.dart';

class DioHelper {
 static late Dio dio ;

 static init()
 {
   dio =Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true,
     )
   );
 }
// late Response response;
 static Future <Response> getData ({required String url,required  Map<String, dynamic> query})async
 {
    return await dio.get<dynamic  >(url,queryParameters: query,);
 }

}