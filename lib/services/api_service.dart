import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ensake_loyalty_app/models/user.dart';
import 'package:ensake_loyalty_app/utils/constants.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  String? _deviceHeader;

  Future<String> _getDeviceHeader() async {
    if (_deviceHeader != null) return _deviceHeader!;

    try {
      String deviceId = 'device_${DateTime.now().millisecondsSinceEpoch}';
      String platform = 'unknown';
      String deviceName = 'unknown';

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        platform = 'android';
        deviceName = '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        platform = 'ios';
        deviceName = '${iosInfo.name} ${iosInfo.model}';
      }

      _deviceHeader = '$deviceId/$platform/$deviceName';
      return _deviceHeader!;
    } catch (e) {
      _deviceHeader = 'unknown/unknown/unknown';
      return _deviceHeader!;
    }
  }

  Future<Map<String, String>> _getHeaders({String? authToken}) async {
    final deviceHeader = await _getDeviceHeader();
    final headers = {
      AppConstants.contentTypeHeader: AppConstants.contentTypeValue,
      AppConstants.ensakeDeviceHeader: deviceHeader,
    };

    if (authToken != null) {
      headers[AppConstants.authorizationHeader] = 'Bearer $authToken';
    }

    return headers;
  }

  Future<User> login(String email, String password) async {
    try {
      final headers = await _getHeaders();
      final response = await http
          .post(
            Uri.parse('${AppConstants.baseUrl}${AppConstants.loginEndpoint}'),
            headers: headers,
            body: json.encode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['message'] == 'Login successful' && data['customer'] != null) {
          return User.fromJson(data);
        } else {
          throw Exception('Invalid response format from server');
        }
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else if (response.statusCode == 422) {
        final errorData = json.decode(response.body);
        if (errorData['errors'] != null) {
          final errors = errorData['errors'] as Map<String, dynamic>;
          final errorMessages =
              errors.values.expand((e) => e as List).join(', ');
          throw Exception(errorMessages);
        } else {
          throw Exception('Validation failed');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server error - Please try again later');
      } else {
        throw Exception('Login failed - Status: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error - Please check your connection');
    } on SocketException catch (e) {
      throw Exception('Connection failed - Please check your network');
    } on FormatException catch (e) {
      throw Exception('Invalid response from server');
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> getRewards(String authToken) async {
    try {
      final headers = await _getHeaders(authToken: authToken);

      final response = await http
          .get(
            Uri.parse('${AppConstants.baseUrl}${AppConstants.rewardsEndpoint}'),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['message'] == 'Rewards fetched successfully' &&
            data['customer_points'] != null &&
            data['rewards'] != null) {
          return data;
        } else {
          throw Exception('Invalid rewards response format from server');
        }
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 403) {
        throw Exception('Access forbidden - Insufficient permissions');
      } else if (response.statusCode == 500) {
        throw Exception('Server error - Please try again later');
      } else {
        throw Exception(
            'Failed to fetch rewards - Status: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error - Please check your connection');
    } on SocketException catch (e) {
      throw Exception('Connection failed - Please check your network');
    } on FormatException catch (e) {
      throw Exception('Invalid response from server');
    } catch (e) {
      throw Exception('Failed to fetch rewards: ${e.toString()}');
    }
  }

  Future<bool> claimReward(String rewardId, String authToken) async {
    try {
      final headers = await _getHeaders(authToken: authToken);

      final response = await http
          .post(
            Uri.parse(
                '${AppConstants.baseUrl}${AppConstants.claimRewardEndpoint}'),
            headers: headers,
            body: json.encode({
              'reward_id': rewardId,
            }),
          )
          .timeout(const Duration(seconds: 30));


      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['message'] != null &&
            data['message'].toString().toLowerCase().contains('success')) {
          return true;
        } else {
          return false;
        }
      } else if (response.statusCode == 400) {
        final data = json.decode(response.body);
        if (data['message'] != null) {
          throw Exception(data['message']);
        } else {
          throw Exception('Insufficient points or invalid request');
        }
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 403) {
        throw Exception('Access forbidden - Insufficient permissions');
      } else if (response.statusCode == 404) {
        throw Exception('Reward not found');
      } else if (response.statusCode == 409) {
        throw Exception('Reward already claimed');
      } else if (response.statusCode == 500) {
        throw Exception('Server error - Please try again later');
      } else {
        throw Exception(
            'Failed to claim reward - Status: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error - Please check your connection');
    } on SocketException catch (e) {
      throw Exception('Connection failed - Please check your network');
    } on FormatException catch (e) {
      throw Exception('Invalid response from server');
    } catch (e) {
      throw Exception('Failed to claim reward: ${e.toString()}');
    }
  }
}
