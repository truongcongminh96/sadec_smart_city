import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://congdan-sdc-api.vnptdongthap.com.vn/api/v1/ReadAppData/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<dynamic> postData(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('QueryData', data: data);
      return response.data;
    } catch (e) {
      throw Exception('API call failed: $e');
    }
  }
}
