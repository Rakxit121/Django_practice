import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  int _attemptCount = 0; // Counter for failed attempts
  static const int _maxAttempts = 3; // Maximum number of allowed attempts

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulated user credentials for demonstration
      const String email = 'a@g.c';
      const String password = 'a';

      // Simulate a network request delay
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Simulated response for the example
      const responseStatusCode =
          200; // You would typically get this from an API
      const responseBody =
          '{"token": "dummy_token"}'; // Simulated response body

      // Checking if the credentials are correct
      if (_emailController.text == email &&
          _passwordController.text == password) {
        // Login successful
        final data = json.decode(responseBody);
        if (data['token'] != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          _showError("Invalid credentials. Please try the correct password.");
        }
      } else {
        // Increment the attempt count on failure
        _attemptCount++;
        _checkAttemptCount();
      }
    }
  }

  void _checkAttemptCount() {
    if (_attemptCount >= _maxAttempts) {
      _showError("Maximum login attempts exceeded. Please try again later.");
      // Optionally disable login button or take other actions here
    } else {
      _showError("Invalid credentials. Please try the correct password.");
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Login Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Forgot Password"),
        content: const Text(
            "Please contact support or check your email for password reset instructions."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  final List locale = [
    {'language': 'English', 'locale': const Locale('en', 'US')},
    {'language': 'Nepali', 'locale': const Locale('np', 'NP')}
  ];

  void updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  void _buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: const Text('Choose Your Language'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(locale[index]['language']),
                    onTap: () {
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: GlassmorphicContainer(
              width: 350,
              height: 450,
              borderRadius: 20,
              blur: 8,
              linearGradient: const LinearGradient(
                colors: [
                  Color.fromARGB(100, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: 2,
              borderGradient: const LinearGradient(
                colors: [
                  Color.fromARGB(100, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: _forgotPassword,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => _buildDialog(context),
            tooltip: 'Change Language',
            backgroundColor: Colors.blue,
            child: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}
