

import '../data/api_urls.dart';
import '../data/base_api_client.dart';
import '../models/login/otp_request.dart';
import '../models/login/otp_response.dart';

class OtpRepository {
  final BaseApiClient _apiClient = BaseApiClient();

  // Login method using BaseApiClient
  Future<OtpResponse> validateOtp(OtpRequest otpRequest) async {
    try {
      final response = await _apiClient.post<OtpResponse>(
        ApiConstants.otpUrl, // Your login endpoint
        otpRequest.toJson(), // Convert to JSON
        fromJson: (json) => OtpResponse.fromJson(json), // Parse response
        isJson: true, // Content-Type: application/json
      );
      return response;
    } catch (e) {
      throw Exception('Otp Validation failed: $e');
    }
  }
}
