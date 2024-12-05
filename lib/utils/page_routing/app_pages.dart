import 'package:flutter/material.dart';
import 'package:glc/view/farmlands.dart';
import 'package:glc/view/login/AccountCreatedUi.dart';
import 'package:glc/view/login/Changepassword.dart';
import 'package:glc/view/login/DashBoardUi.dart';
import 'package:glc/view/login/FarmLandDetailsUi.dart';
import 'package:glc/view/login/OtpValidationUI.dart';
import 'package:glc/view/login/loginUi.dart';

import '../../view/login/ForgotpasswordUi.dart';
import '../../view/login/OtpVerify.dart';
import '../../view/login/SignupAccountUi.dart';
import '../../view/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.splash: (context) => const SplashView(),
      AppRoutes.signUp: (context) => SignupPage(),
      AppRoutes.login: (context) => LoginPage(),
      AppRoutes.otp: (context) => OTPverifyPage(),
      AppRoutes.forgot_password: (context) => ForgotPage(),
      AppRoutes.change_password: (context) => ChangePasswordPage(),
      AppRoutes.account_created: (context) => AccountCreatedPage(),
      AppRoutes.dashboard: (context) => DashBoardPage(),
      AppRoutes.farmlands: (context) => FarmlandListingPage(),
      AppRoutes.otpvalidate: (context) => OTPValidationPage(),
      AppRoutes.farmlandsdetails: (context) => FarmlandDetailsPage(),
    };
  }
}
