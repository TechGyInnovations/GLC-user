import 'package:flutter/material.dart';

import '../models/login/otp_request.dart';
import '../models/login/otp_response.dart';
import '../repo/otp_repository.dart';
import '../res/snackbar_reusable.dart';
import '../utils/app_constants.dart';

class OtpViewModel with ChangeNotifier {
  final OtpRepository _otpRepository = OtpRepository();
  bool _isLoading = false;
  String errorMessage = '';

  bool get isLoading => _isLoading;
  String get getErrorMessage => errorMessage;

  TextEditingController otpController = TextEditingController();

  // Call the login method
  Future<void> validateOtp(BuildContext context) async {
    try {
      if (otpController.text.trim().length > 4) {
        _setLoading(true);
        final request = OtpRequest(
            phone: AppConstants.mobileNo,
            fcmToken: "fcm_token",
            otp: otpController.text);
        // Call the login method from LoginRepository
        OtpResponse response = await _otpRepository.validateOtp(request);

        // Handle success response
        if (response.message != null) {
          // Navigate to OTP verification screen or show a success message
          if (!context.mounted) return;
          _showSuccessDialog('OTP sent successfully', context);
          // You can also navigate to the next screen
          // Navigator.pushNamed(context, '/otpVerification');
        } else {
          // Handle failure case (e.g., OTP not sent)
          _showErrorDialog('Failed to send OTP: ${response.message}');
        }
      }
    } catch (e) {
      // Handle any exceptions or network errors
      _showErrorDialog('Login failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Helper to set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Show success message or dialog
  void _showSuccessDialog(String message, BuildContext context) {
    // Implement your success dialog or snackbar here
    showSnackBar(context, message);
    print(message); // or use showDialog, showSnackBar, etc.
  }

  // Show error message or dialog
  void _showErrorDialog(String message) {
    // Implement your error dialog or snackbar here
    print(message); // or use showDialog, showSnackBar, etc.
  }
}
