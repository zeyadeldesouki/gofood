import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> get({
    required String baseUrl,
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
