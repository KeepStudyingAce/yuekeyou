import 'package:dio/dio.dart';

/// 所有接口类
class AppApi {
  static Future getBreedsList() async {
    final dio = Dio();
    final response = await dio.get('https://dog.ceo/api/breeds/list/all');
    return response.data;
  }
}
