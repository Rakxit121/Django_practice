import 'package:flutter/material.dart';

import 'employee_list_screen.dart'; // Import the Employee List screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToEmployeeList();
  }

  _navigateToEmployeeList() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EmployeeListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Employee Management System',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
