import 'package:flutter/material.dart';
import 'package:glc/utils/page_routing/app_pages.dart';
import 'package:glc/utils/page_routing/app_routes.dart';
import 'package:glc/view_model/login_view_model.dart';
import 'package:glc/view_model/validate_otp_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppPages.routes,
        initialRoute: AppRoutes.initial,
        title: "Green Land Capital",
      ),
    );
  }
}
