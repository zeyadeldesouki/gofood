import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<Map<String, dynamic>> get({
    required String endpoint,
    required int limit,
    required int skip,
  }) async {
    Response response = await dio.get(
      "$baseUrl/$endpoint",
      queryParameters: {'limit': limit, 'skip': skip},
    );
    return response.data;
  }
}
