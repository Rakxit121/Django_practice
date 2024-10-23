import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'add_employee_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Map<String, dynamic>> employees = [];

  @override
  void initState() {
    super.initState();
    _loadEmployees(); // Load employees when the screen is initialized
  }

  // Function to load employees from local storage (implement this based on your storage)
  void _loadEmployees() async {
    // Load employees from your local storage or another source
    // employees = await LocalStorage.getEmployees(); // Uncomment this when you have local storage setup
  }

  // Function to add a new employee to the list
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
      // Simulate syncing
      setState(() {
        employees[index]['isSynced'] = true;
      });
      // Implement actual syncing logic here (e.g., API call)
    }
  }

  // Show alert dialog
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Status'),
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

  // Show qualifications in a dialog
  void _showQualifications(String qualificationsPath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Qualifications'),
        content: qualificationsPath.isNotEmpty
            ? Image.file(File(qualificationsPath)) // Load the image
            : const Text('No qualifications uploaded.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Function to refresh employee list and check connectivity
  Future<void> _refreshEmployeeList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    String message;

    if (connectivityResult == ConnectivityResult.none) {
      message = "You are not connected to the internet.";
    } else {
      message = "You are connected to the internet.";
      // Here, you can add logic to refresh employee data from an API or local storage
      // e.g., employees = await LocalStorage.getEmployees();
      setState(() {
        // If needed, update your employee list here
      });
    }

    _showAlertDialog(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshEmployeeList,
          ),
        ],
      ),
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
            child: const Text('Add Employee'),
          ),
          Expanded(
            child: employees.isEmpty
                ? const Center(child: Text('No Employees'))
                : ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      return ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(employee['name'] ?? 'N/A'),
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
                            // Qualifications button
                            IconButton(
                              icon: const Icon(Icons.file_present),
                              onPressed: () => _showQualifications(
                                  employee['qualifications']),
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
