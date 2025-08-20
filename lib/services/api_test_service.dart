import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ensake_loyalty_app/utils/constants.dart';

class ApiTestService {
  static Future<Map<String, dynamic>> testConnection() async {
    try {
      // Test basic connectivity
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}/login'),
        headers: {
          AppConstants.contentTypeHeader: AppConstants.contentTypeValue,
        },
      ).timeout(const Duration(seconds: 10));

      return {
        'success': true,
        'statusCode': response.statusCode,
        'headers': response.headers.toString(),
        'body': response.body.substring(
            0, response.body.length > 200 ? 200 : response.body.length),
      };
    } on SocketException catch (e) {
      return {
        'success': false,
        'error': 'SocketException: ${e.message}',
        'type': 'SocketException',
      };
    } on HttpException catch (e) {
      return {
        'success': false,
        'error': 'HttpException: ${e.message}',
        'type': 'HttpException',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Unknown error: $e',
        'type': 'Unknown',
      };
    }
  }

  static Future<Map<String, dynamic>> testLoginEndpoint() async {
    try {
      final response = await http
          .post(
            Uri.parse('${AppConstants.baseUrl}/login'),
            headers: {
              AppConstants.contentTypeHeader: AppConstants.contentTypeValue,
              AppConstants.ensakeDeviceHeader: 'test-device-123/ios/iPhone 13',
            },
            body: '{"email": "test@test.com", "password": "test"}',
          )
          .timeout(const Duration(seconds: 10));

      return {
        'success': true,
        'statusCode': response.statusCode,
        'headers': response.headers.toString(),
        'body': response.body.substring(
            0, response.body.length > 200 ? 200 : response.body.length),
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Error: $e',
        'type': 'Unknown',
      };
    }
  }
}

