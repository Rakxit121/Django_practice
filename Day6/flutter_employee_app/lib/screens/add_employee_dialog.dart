import 'package:flutter/material.dart';

class AddEmployeeDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  final Map<String, dynamic>? employee;

  const AddEmployeeDialog({super.key, required this.onSubmit, this.employee});

  @override
  _AddEmployeeDialogState createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  final _formKey = GlobalKey<FormState>();

  String? _name,
      _employeeId,
      _mobileNumber,
      _homePhoneNumber,
      _email,
      _address,
      _gender,
      _status,
      _qualifications;

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _name = widget.employee!['name'];
      _employeeId = widget.employee!['employeeId'];
      _mobileNumber = widget.employee!['mobileNumber'];
      _homePhoneNumber = widget.employee!['homePhoneNumber'];
      _email = widget.employee!['email'];
      _address = widget.employee!['address'];
      _gender = widget.employee!['gender'];
      _status = widget.employee!['status'];
      _qualifications = widget.employee!['qualifications'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.employee == null ? 'Add Employee' : 'Edit Employee'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Name field
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              // Employee ID field
              TextFormField(
                initialValue: _employeeId,
                decoration: const InputDecoration(labelText: 'Employee ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter employee ID';
                  }
                  return null;
                },
                onSaved: (value) => _employeeId = value,
              ),
              // Mobile Number field
              TextFormField(
                initialValue: _mobileNumber,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a mobile number';
                  }
                  return null;
                },
                onSaved: (value) => _mobileNumber = value,
              ),
              // Home Phone Number field
              TextFormField(
                initialValue: _homePhoneNumber,
                decoration:
                    const InputDecoration(labelText: 'Home Phone Number'),
                onSaved: (value) => _homePhoneNumber = value,
              ),
              // Email field
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              // Address field
              TextFormField(
                initialValue: _address,
                decoration: const InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value,
              ),
              // Gender dropdown
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Male')),
                  DropdownMenuItem(value: '2', child: Text('Female')),
                  DropdownMenuItem(value: '4', child: Text('Other')),
                ],
                onChanged: (value) => setState(() => _gender = value),
                onSaved: (value) => _gender = value,
              ),
              // Status dropdown
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: 'active', child: Text('Active')),
                  DropdownMenuItem(
                      value: 'terminated', child: Text('Terminated')),
                  DropdownMenuItem(value: 'present', child: Text('Present')),
                ],
                onChanged: (value) => setState(() => _status = value),
                onSaved: (value) => _status = value,
              ),
              // Qualifications field
              TextFormField(
                initialValue: _qualifications,
                decoration: const InputDecoration(labelText: 'Qualifications'),
                onSaved: (value) => _qualifications = value,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onSubmit({
                'name': _name,
                'employeeId': _employeeId,
                'mobileNumber': _mobileNumber,
                'homePhoneNumber': _homePhoneNumber,
                'email': _email,
                'address': _address,
                'gender': _gender,
                'status': _status,
                'qualifications': _qualifications,
                'isSynced': false, // By default, not synced to the server
              });
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
