import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToEmployeeList();
  }

  _navigateToEmployeeList() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(builder: (context) => const LoginScreen()),
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Background color for splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your app logo or splash content here
            Image.asset('assets/splash_logo.png',
                height: 150), // Splash screen logo
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
