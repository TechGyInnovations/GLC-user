

import '../data/api_urls.dart';
import '../data/base_api_client.dart';
import '../models/login/login_reponse.dart';
import '../models/login/login_request_model.dart';

class LoginRepository {
  final BaseApiClient _apiClient = BaseApiClient();

  // Login method using BaseApiClient
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiClient.post<LoginResponse>(
        ApiConstants.loginUrl, // Your login endpoint
        loginRequest.toJson(), // Convert to JSON
        fromJson: (json) => LoginResponse.fromJson(json), // Parse response
        isJson: true, // Content-Type: application/json
      );
      return response;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
