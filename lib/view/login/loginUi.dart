import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/page_routing/app_routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isPasswordHide = true;
  bool isFormValid = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animations
    _controller.forward();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // Extends body behind the status bar
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.grey,
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              // Replace with your image asset path
              fit: BoxFit.fill, // Makes the image cover the entire screen
            ),
          ),
          child: SingleChildScrollView(
            // Wrap content in SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // Back Arrow Icon
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Logo Section with Fade-in Animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            // Replace with the logo asset path
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Section
                  SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Welcome back! Sign in using your Email',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Email Text Field
                        const Align(
                          alignment: Alignment.centerLeft,
                          // Aligns the text to the left
                          child: Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            filled: true,
                            fillColor: Colors.grey[200],

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Password Text Field
                        const Align(
                          alignment: Alignment.centerLeft,
                          // Aligns the text to the left
                          child: Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: passwordController,
                          obscureText: isPasswordHide,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            filled: true,
                            fillColor: Colors.grey[200], // password visible condition and icon change
                            suffixIcon: IconButton(icon: Icon(isPasswordHide ? Icons.visibility : Icons.visibility_off),onPressed: () {
                              setState(() {
                                isPasswordHide = !isPasswordHide;
                              });
                            },),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Remember Me and Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(activeColor:Colors.black,
                                    value: isChecked,
                                    onChanged: (value) {
                                      isChecked = value!; // checkbox check changed
                                  setState(() {

                                  });
                                    }),
                                const Text('Remember Me'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.forgot_password);
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Button with Scale Animation
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: ScaleTransition(
                          scale: _fadeAnimation,
                          child: SizedBox(
                            width: double.infinity,
                            // Use full width of the parent container
                            child: ElevatedButton(
                              onPressed: () {
                                if (isFormValid) {
                                  Navigator.pushNamed(context, AppRoutes.farmlandsdetails);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:(emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty) ? Colors.green : Colors.grey[200],
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: isFormValid ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Sign Up Section
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, AppRoutes.signUp);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ));
  }

  bool validations() {
    // Add your custom validation logic here
    if(emailController.text.trim().isEmpty)
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Please enter a Email ID',
          style: TextStyle(color: Colors.black),
        ),
      ));
      return isFormValid;
    }
    else if(passwordController.text.trim().isEmpty)
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Please enter password',
          style: TextStyle(color: Colors.black),
        ),
      ));
      return isFormValid;
    }
    else{
      return isFormValid=true;
    }

  }

  void _validateForm() {
    setState(() {

        isFormValid = emailController.text.trim().isNotEmpty &&
            passwordController.text.trim().isNotEmpty ;

    });
  }
}
