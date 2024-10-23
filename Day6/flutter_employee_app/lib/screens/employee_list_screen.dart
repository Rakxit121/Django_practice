import 'package:flutter/material.dart';

import 'add_employee_dialog.dart';

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
  void _syncToServer(int index) {
    setState(() {
      employees[index]['isSynced'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddEmployeeDialog(onSubmit: _addEmployee),
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
                                  builder: (context) => AddEmployeeDialog(
                                    onSubmit: (updatedEmployee) =>
                                        _editEmployee(index, updatedEmployee),
                                    employee: employee,
                                  ),
                                );
                              },
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
                            : Colors
                                .red[100], // Change color based on sync status
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
