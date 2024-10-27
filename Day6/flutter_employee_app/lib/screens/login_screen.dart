import 'dart:convert'; // For parsing responses

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
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.jpg', // Replace with your image path
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to signup screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        tooltip: 'Sign Up',
        backgroundColor: Colors.blue,
        elevation: 10.0,
        shape: const CircleBorder(),
        child: const Icon(Icons.person_add),
        // color: Colors.white,
        // padding: EdgeInsets.symmetric(horizontal: 10.0),
        // margin: EdgeInsets.symmetric(vertical: 10.0),
      ),
    );
  }
}




















// import 'dart:convert'; // For parsing responses

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // For background image
// import 'package:flutter_employee_app/screens/home_page.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   // Future<void> _login() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     setState(() {
//   //       _isLoading = true;
//   //     });

//   //     // Replace with your Django backend URL
//   //     final url = Uri.parse('https://your-backend.com/api/login/');
//   //     final response = await http.post(url, body: {
//   //       'email': _emailController.text,
//   //       'password': _passwordController.text,
//   //     });

//   //     setState(() {
//   //       _isLoading = false;
//   //     });

//   //     if (response.statusCode == 200) {
//   //       final data = json.decode(response.body);
//   //       if (data['token'] != null) {
//   //         // Save token using Provider or SharedPreferences, and navigate to the home screen
//   //         Navigator.pushReplacement(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => const HomePage()),
//   //         );
//   //       } else {
//   //         _showError("Invalid credentials. Please try the correct password.");
//   //       }
//   //     } else {
//   //       _showError("Server error, please try again later.");
//   //     }
//   //   }
//   // }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       // Static email and password
//       const email = 'a@g.c';
//       const password = 'a';

//       // Simulate a network request
//       await Future.delayed(const Duration(seconds: 2));

//       setState(() {
//         _isLoading = false;
//       });

//       // Simulate a successful response
//       const responseStatusCode = 200;
//       const responseBody = '{"token": "dummy_token"}';

//       if (responseStatusCode == 200) {
//         final data = json.decode(responseBody);
//         if (data['token'] != null) {
//           // Save token using Provider or SharedPreferences, and navigate to the home screen
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const HomePage()),
//           );
//         } else {
//           _showError("Invalid credentials. Please try the correct password.");
//         }
//       } else {
//         _showError("Server error, please try again later.");
//       }
//     }
//   }

//   void _showError(String message) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Login Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent, // Remove background color
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value:
//             SystemUiOverlayStyle.light, // Light status bar for dark background
//         child: Stack(
//           children: [
//             // Background image
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: const AssetImage(
//                       'assets/background.png'), // Replace with your image path
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),
//                       BlendMode.multiply), // Apply dark filter
//                 ),
//               ),
//             ),
//             // Login form container with glassmorphism effect
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16.0),
//                   color: Colors.white
//                       .withOpacity(0.2), // Semi-transparent white background
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: const InputDecoration(labelText: "Email"),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email'.tr;
//                           }
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration:
//                             const InputDecoration(labelText: "Password"),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       _isLoading
//                           ? const CircularProgressIndicator()
//                           : ElevatedButton(
//                               onPressed: _login,
//                               child: const Text("Login"),
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
