import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ensake_loyalty_app/models/user.dart';
import 'package:ensake_loyalty_app/services/api_service.dart';
import 'package:ensake_loyalty_app/utils/constants.dart';

class AuthProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final ApiService _apiService = ApiService();

  User? _user;
  String? _authToken;
  bool _isLoading = false;
  DateTime? _tokenExpiry;
  Timer? _sessionTimer;

  User? get user => _user;
  String? get authToken => _authToken;
  bool get isLoading => _isLoading;
  bool get isAuthenticated =>
      _authToken != null && _user != null && !_isTokenExpired();

  bool _isTokenExpired() {
    return _tokenExpiry != null && DateTime.now().isAfter(_tokenExpiry!);
  }

  Future<void> initialize() async {
    try {
      _authToken = await _storage.read(key: AppConstants.authTokenKey);
      if (_authToken != null) {
        // Check if token is expired
        if (_isTokenExpired()) {
          await logout();
        } else {
          // Start session timer
          _startSessionTimer();
        }
      }
    } catch (e) {
      await logout();
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();


      final user = await _apiService.login(email, password);

      _user = user;
      _authToken = user.token;

      _tokenExpiry = DateTime.now()
          .add(const Duration(minutes: AppConstants.sessionTimeoutMinutes));

      await _storage.write(key: AppConstants.authTokenKey, value: _authToken);

      _startSessionTimer();

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> logout() async {
    _user = null;
    _authToken = null;
    _tokenExpiry = null;
    _stopSessionTimer();

    try {
      await _storage.delete(key: AppConstants.authTokenKey);
    } catch (e) {
      // Ignore storage errors
    }

    notifyListeners();
  }

  void _startSessionTimer() {
    _stopSessionTimer();

    if (_tokenExpiry != null) {
      final timeUntilExpiry = _tokenExpiry!.difference(DateTime.now());
      if (timeUntilExpiry.isNegative) {
        logout();
        return;
      }

      _sessionTimer = Timer(timeUntilExpiry, () {
        logout();
      });
    }
  }

  void _stopSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = null;
  }

  void updateUserPoints(int newPoints) {
    // Note: The User model no longer stores points directly
    // Points are managed by the RewardsProvider
    // This method is kept for backward compatibility but doesn't modify the user
  }

  @override
  void dispose() {
    _stopSessionTimer();
    super.dispose();
  }
}
