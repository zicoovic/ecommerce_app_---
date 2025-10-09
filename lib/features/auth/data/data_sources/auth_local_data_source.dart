import 'dart:convert';
import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local data source for authentication
/// Handles saving/retrieving auth tokens from SharedPreferences
/// Follows Clean Architecture - Data Layer
abstract class AuthLocalDataSource {
  /// Save authentication response to local storage
  Future<void> saveAuthResponse(AuthResponseModel authResponse);

  /// Get saved authentication response from local storage
  Future<AuthResponseModel?> getAuthResponse();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Clear authentication data (logout)
  Future<void> clearAuthData();

  /// Get access token
  Future<String?> getAccessToken();
}

/// Implementation of AuthLocalDataSource using SharedPreferences
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _keyAuthResponse = 'auth_response';
  static const String _keyAccessToken = 'access_token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _keyExpiresAt = 'expires_at';
  static const String _keyIsLoggedIn = 'is_logged_in';

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveAuthResponse(AuthResponseModel authResponse) async {
    // Save as JSON
    await sharedPreferences.setString(
      _keyAuthResponse,
      jsonEncode(authResponse.toJson()),
    );

    // Save individual fields for easy access
    await sharedPreferences.setString(_keyAccessToken, authResponse.accessToken);
    await sharedPreferences.setString(_keyRefreshToken, authResponse.refreshToken);
    await sharedPreferences.setString(_keyExpiresAt, authResponse.expiresAtUtc);
    await sharedPreferences.setBool(_keyIsLoggedIn, true);
  }

  @override
  Future<AuthResponseModel?> getAuthResponse() async {
    final authResponseJson = sharedPreferences.getString(_keyAuthResponse);
    if (authResponseJson != null) {
      return AuthResponseModel.fromJson(jsonDecode(authResponseJson));
    }
    return null;
  }

  @override
  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool(_keyIsLoggedIn) ?? false;
  }

  @override
  Future<void> clearAuthData() async {
    await sharedPreferences.remove(_keyAuthResponse);
    await sharedPreferences.remove(_keyAccessToken);
    await sharedPreferences.remove(_keyRefreshToken);
    await sharedPreferences.remove(_keyExpiresAt);
    await sharedPreferences.setBool(_keyIsLoggedIn, false);
  }

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(_keyAccessToken);
  }
}