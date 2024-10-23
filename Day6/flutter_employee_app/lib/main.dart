import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
    // Ensure all bindings are initialized
  // WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Hive
  // await Hive.initFlutter();

  // // Open a box for storing employee data
  // await Hive.openBox('employeeBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Start with the splash screen
    );
  }
}
