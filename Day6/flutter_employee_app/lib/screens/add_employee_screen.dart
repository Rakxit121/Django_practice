import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployeeScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  final Map<String, dynamic>? employee;

  const AddEmployeeScreen({super.key, required this.onSubmit, this.employee});

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  String? _name,
      _employeeId,
      _mobileNumber,
      _email,
      _address,
      _gender,
      _level,
      _status;
      
  XFile? _qualificationsFile; // Store the picked image file

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _name = widget.employee!['name'];
      _employeeId = widget.employee!['employeeId'];
      _mobileNumber = widget.employee!['mobileNumber'];
      _email = widget.employee!['email'];
      _address = widget.employee!['address'];
      _gender = widget.employee!['gender'];
      _level = widget.employee!['level'];
      _status = widget.employee!['status'];
      // Note: You'll need to handle the qualifications if you're using an image
    }
  }

  Future<void> _pickFile() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _qualificationsFile = image; // Save the selected file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee == null ? 'Add Employee' : 'Edit Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                    DropdownMenuItem(value: '3', child: Text('Other')),
                  ],
                  onChanged: (value) => setState(() => _gender = value),
                  onSaved: (value) => _gender = value,
                ),
                // Level dropdown
                DropdownButtonFormField<String>(
                  value: _level,
                  decoration: const InputDecoration(labelText: 'Level'),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('1')),
                    DropdownMenuItem(value: '2', child: Text('2')),
                    DropdownMenuItem(value: '3', child: Text('3')),
                    DropdownMenuItem(value: '4', child: Text('4')),
                  ],
                  onChanged: (value) => setState(() => _level = value),
                  onSaved: (value) => _level = value,
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
                // Qualifications button
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text(_qualificationsFile != null
                      ? 'Selected: ${_qualificationsFile!.name}'
                      : 'Select Qualifications Image'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            widget.onSubmit({
              'name': _name,
              'employeeId': _employeeId,
              'mobileNumber': _mobileNumber,
              'email': _email,
              'address': _address,
              'gender': _gender,
              'level': _level,
              'status': _status,
              'qualifications': _qualificationsFile != null ? _qualificationsFile!.path : null,
              'isSynced': false, // By default, not synced to the server
            });
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
