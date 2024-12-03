import 'package:flutter/material.dart';

import '../models/login/login_reponse.dart';
import '../models/login/login_request_model.dart';
import '../repo/login_repository.dart';
import '../res/snackbar_reusable.dart';
import '../utils/app_constants.dart';
import '../utils/internet_connectivity.dart';
import '../utils/page_routing/app_routes.dart';

class LoginViewModel with ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  loginApi(BuildContext context) async {
    String mobileNumber = mobileController.text.trim();

    // Check if the mobile number starts with a valid digit (6, 7, 8, or 9)
    if (mobileNumber.isNotEmpty &&
        (mobileNumber.startsWith('9') ||
            mobileNumber.startsWith('8') ||
            mobileNumber.startsWith('7') ||
            mobileNumber.startsWith('6'))) {
      // Validate the mobile number pattern
      if (!_validateMobileNumber(mobileNumber)) {
        // Invalid number pattern
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Please enter a valid mobile number (10 digits, starting with 6-9)'),
        ));
      } else {
        // Valid mobile number
        if (await isNetworkAvailable()) {
          // Simulate network request
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Mobile number is valid, proceeding with login...'),
          ));
          // Your login logic here

          loginUser(mobileNumber, context);
        }
      }
    }
  }

  // Function to validate mobile number
  bool _validateMobileNumber(String mobileNumber) {
    const validNumberPattern = r"^[6-9][0-9]{9}$";
    RegExp regExp = RegExp(validNumberPattern);

    return regExp.hasMatch(mobileNumber);
  }

  final LoginRepository _loginRepository = LoginRepository();
  bool _isLoading = false;
  String errorMessage = '';

  bool get isLoading => _isLoading;
  String get getErrorMessage => errorMessage;

  // Call the login method
  Future<void> loginUser(String mobileNumber, BuildContext context) async {
    try {
      _setLoading(true);
      final request = LoginRequest(phone: mobileNumber);
      // Call the login method from LoginRepository
      LoginResponse response = await _loginRepository.login(request);

      // Handle success response
      if (response.message != null) {
        AppConstants.mobileNo = mobileNumber;
        // Navigate to OTP verification screen or show a success message
        if (!context.mounted) return;
        _showSuccessDialog('OTP sent successfully', context);
        Navigator.pushNamed(context, AppRoutes.otp);
        // You can also navigate to the next screen
        // Navigator.pushNamed(context, '/otpVerification');
      } else {
        // Handle failure case (e.g., OTP not sent)
        _showErrorDialog('Failed to send OTP: ${response.message}');
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
