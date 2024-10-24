import 'dart:convert'; // For parsing responses

import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/home_page.dart';

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

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     // Replace with your Django backend URL
  //     final url = Uri.parse('https://your-backend.com/api/login/');
  //     final response = await http.post(url, body: {
  //       'email': _emailController.text,
  //       'password': _passwordController.text,
  //     });

  //     setState(() {
  //       _isLoading = false;
  //     });

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       if (data['token'] != null) {
  //         // Save token using Provider or SharedPreferences, and navigate to the home screen
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const HomePage()),
  //         );
  //       } else {
  //         _showError("Invalid credentials. Please try the correct password.");
  //       }
  //     } else {
  //       _showError("Server error, please try again later.");
  //     }
  //   }
  // }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Static email and password
      const email = 'a@g.c';
      const password = 'a';

      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Simulate a successful response
      const responseStatusCode = 200;
      const responseBody = '{"token": "dummy_token"}';

      if (responseStatusCode == 200) {
        final data = json.decode(responseBody);
        if (data['token'] != null) {
          // Save token using Provider or SharedPreferences, and navigate to the home screen
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
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
                      onPressed: _login, child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
