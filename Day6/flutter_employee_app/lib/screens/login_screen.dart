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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      const email = 'a@g.c';
      const password = 'a';

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      const responseStatusCode = 200;
      const responseBody = '{"token": "dummy_token"}';

      if (responseStatusCode == 200) {
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
        _showError("Server error, please try again later.");
      }
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("login_error".tr),
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
        title: Text("forgot_password".tr),
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
                      Text(
                        'login'.tr,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'email'.tr,
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password'.tr,
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password'.tr;
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
                              child: Text('login'.tr),
                            ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: _forgotPassword,
                        child: Text(
                          "forgot_password".tr,
                          style: const TextStyle(
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
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            tooltip: 'Sign Up',
            backgroundColor: Colors.blue,
            child: const Icon(Icons.person_add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () => _buildDialog(context),
            label: Text("".tr),
            icon: const Icon(Icons.language),
            tooltip: 'Sign Up',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
