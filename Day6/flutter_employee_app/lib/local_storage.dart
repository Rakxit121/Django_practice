import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<List<Map<String, String>>> getEmployees() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> employeesJson = prefs.getStringList('employees') ?? [];
    return employeesJson
        .map((e) => Map<String, String>.from(json.decode(e)))
        .toList();
  }

  static Future<void> saveEmployee(Map<String, String> employee) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> employeesJson = prefs.getStringList('employees') ?? [];
    employeesJson.add(json.encode(employee));
    prefs.setStringList('employees', employeesJson);
  }
}
