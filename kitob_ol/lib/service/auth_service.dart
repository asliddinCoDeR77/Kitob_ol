import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://3.68.216.185:8069/api/swagger/index.html#/';

  // Send SMS code during registration
  Future<Response> sendSmsCodeRegister(String phone) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/sms/register/phone',
        data: {'phone': phone},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send SMS code: $e');
    }
  }

  // Send SMS code during login
  Future<Response> sendSmsCodeLogin(String phone) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/sms/login/phone',
        data: {'phone': phone},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send SMS code: $e');
    }
  }

  // Verify the SMS code
  Future<Response> verifyCode(String phone, String code) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/sms/register/phone',
        data: {'phone': phone, 'code': code},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to verify code: $e');
    }
  }
}
