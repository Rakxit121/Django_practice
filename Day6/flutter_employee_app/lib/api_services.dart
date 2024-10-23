import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/employees/';

  static Future<void> syncEmployee(Map<String, String> employee) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(employee),
    );

    if (response.statusCode == 201) {
      print('Employee synced successfully');
    } else {
      print('Failed to sync employee');
    }
  }
}
