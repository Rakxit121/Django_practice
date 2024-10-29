import 'package:flutter/material.dart';

class ShowRecords extends StatelessWidget {
  final List<Map<String, String>> healthInsuranceData = [
    {
      'name': 'John Doe',
      'policyNumber': '123456789',
      'provider': 'HealthCare Inc.',
      'validity': '2023-12-31'
    },
    {
      'name': 'Jane Smith',
      'policyNumber': '987654321',
      'provider': 'Wellness Corp.',
      'validity': '2024-06-30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Insurance Records'),
      ),
      body: ListView.builder(
        itemCount: healthInsuranceData.length,
        itemBuilder: (context, index) {
          final record = healthInsuranceData[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(record['name'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Policy Number: ${record['policyNumber']}'),
                  Text('Provider: ${record['provider']}'),
                  Text('Validity: ${record['validity']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ShowRecords(),
//   ));
// }