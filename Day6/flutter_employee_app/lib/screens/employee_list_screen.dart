import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_employee_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Map<String, dynamic>> employees = [];

  // Function to add new employee to the list
  void _addEmployee(Map<String, dynamic> employee) {
    setState(() {
      employees.add(employee);
    });
  }

  // Function to edit employee details
  void _editEmployee(int index, Map<String, dynamic> updatedEmployee) {
    setState(() {
      employees[index] = updatedEmployee;
    });
  }

  // Function to delete an employee
  void _deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
  }

  // Function to simulate syncing to server
  void _syncToServer(int index) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _showAlertDialog("You are not connected to the internet.");
    } else {
      setState(() {
        employees[index]['isSynced'] = true;
      });
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showQualifications(String qualifications) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Qualifications'),
        content: Text(qualifications.isNotEmpty
            ? qualifications
            : 'No qualifications uploaded.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

// // Function to show qualifications
// void _showQualifications(List<String>? qualifications) {
//   // Check if qualifications are null or empty
//   if (qualifications == null || qualifications.isEmpty) {
//     // Show a message indicating that qualifications are not uploaded
//     _showMessage('Qualifications are not uploaded.');
//     return;
//   }

//   // Continue with your logic to display qualifications
//   // For example, you can show them in a dialog or another screen
//   _showQualificationsDialog(qualifications);
// }

// // Function to show a simple message
// void _showMessage(String message) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Information'),
//       content: Text(message),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// // Function to show qualifications in a dialog
// void _showQualificationsDialog(List<String> qualifications) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Qualifications'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: qualifications
//             .map((qualification) => Text(qualification))
//             .toList(),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('title'.tr),
      // ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddEmployeeScreen(onSubmit: _addEmployee)),
              );
            },
            child: Text('add_employee'.tr),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const HealthInsuranceForm()),
          //     );
          //   },
          //   child: Text('Heath insurance form'.tr),
          // ),
          Expanded(
            child: employees.isEmpty
                ? Center(child: Text('no_employee'.tr))
                : ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      return ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(employee['name'.tr] ?? 'N/A'),
                        subtitle:
                            Text('ID: ${employee['employeeId'] ?? 'N/A'}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Sync button
                            if (!employee['isSynced'])
                              IconButton(
                                icon: const Icon(Icons.cloud_upload),
                                onPressed: () => _syncToServer(index),
                              ),
                            // Edit button
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddEmployeeScreen(
                                    onSubmit: (updatedEmployee) =>
                                        _editEmployee(index, updatedEmployee),
                                    employee: employee,
                                  ),
                                );
                              },
                            ),
                            
                            // create heathcareform button
                            // if (employee['hasHeathcareForm'])
                            // create jobhistory button
                            // Qualifications button
                            IconButton(
                              icon: const Icon(Icons.file_present),
                              onPressed: () => _showQualifications(
                                  employee['qualifications'.tr]),
                            ),
                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteEmployee(index),
                            ),
                          ],
                        ),
                        tileColor: employee['isSynced']
                            ? Colors.green[100]
                            : Colors.red[100],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
