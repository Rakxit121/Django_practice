import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  XFile? _qualificationsFile; // Store the picked qualifications file
  XFile? _profilePicFile; // Store the picked profile picture file

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
      // Note: Handle qualifications and profile picture if applicable
    }
  }

  Future<void> _pickFile() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _qualificationsFile = image; // Save the selected qualifications file
      });
    }
  }

  Future<void> _pickProfilePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profilePicFile = image; // Save the selected profile picture
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.employee == null ? 'add_employee'.tr : 'edit_employee'.tr),
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
                  decoration: InputDecoration(labelText: 'name'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_name'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                // Employee ID field
                TextFormField(
                  initialValue: _employeeId,
                  decoration: InputDecoration(labelText: 'employee_id'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_employee_id'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) => _employeeId = value,
                ),
                // Mobile Number field
                TextFormField(
                  initialValue: _mobileNumber,
                  decoration: InputDecoration(labelText: 'mobile_number'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_mobile_number'.tr;
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'valid_mobile_number'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) => _mobileNumber = value,
                ),
                // Email field
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(labelText: 'email'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_email'.tr;
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'valid_email'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                // Address field
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(
                    labelText: 'address_hint'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_address'.tr;
                    }
                    if (!value.contains(',')) {
                      return 'address_format'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) => _address = value,
                ),
                // Gender dropdown
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(labelText: 'gender'.tr),
                  items: [
                    DropdownMenuItem(value: '1', child: Text('male'.tr)),
                    DropdownMenuItem(value: '2', child: Text('female'.tr)),
                    DropdownMenuItem(value: '3', child: Text('other'.tr)),
                  ],
                  onChanged: (value) => setState(() => _gender = value),
                  onSaved: (value) => _gender = value,
                ),
                // Level dropdown
                DropdownButtonFormField<String>(
                  value: _level,
                  decoration: InputDecoration(labelText: 'level'.tr),
                  items: [
                    DropdownMenuItem(value: '1', child: Text('1'.tr)),
                    DropdownMenuItem(value: '2', child: Text('2'.tr)),
                    DropdownMenuItem(value: '3', child: Text('3'.tr)),
                    DropdownMenuItem(value: '4', child: Text('4'.tr)),
                  ],
                  onChanged: (value) => setState(() => _level = value),
                  onSaved: (value) => _level = value,
                ),
                // Status dropdown
                DropdownButtonFormField<String>(
                  value: _status,
                  decoration: InputDecoration(labelText: 'status'.tr),
                  items: [
                    DropdownMenuItem(value: 'active'.tr, child: Text('active'.tr)),
                    DropdownMenuItem(
                        value: 'terminated'.tr, child: Text('terminated'.tr)),
                    DropdownMenuItem(
                        value: 'present'.tr, child: Text('present'.tr)),
                  ],
                  onChanged: (value) => setState(() => _status = value),
                  onSaved: (value) => _status = value,
                ),
                // Button to select qualifications file
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text(_qualificationsFile != null
                      ? '${'selected'.tr}: ${_qualificationsFile!.name}'
                      : 'select_qualifications'.tr),
                ),
                // Button to select profile picture
                ElevatedButton(
                  onPressed: _pickProfilePicture,
                  child: Text(_profilePicFile != null
                      ? '${'selected_profile_pic'.tr}: ${_profilePicFile!.name}'
                      : 'select_profile_pic'.tr),
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
              'qualifications': _qualificationsFile?.path,
              'profilePic': _profilePicFile?.path,
              'isSynced': false,
            });
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
