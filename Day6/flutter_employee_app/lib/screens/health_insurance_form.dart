import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/heathcareconfirm.dart';

class HealthInsuranceForm extends StatefulWidget {
  const HealthInsuranceForm({super.key});

  @override
  _HealthInsuranceFormState createState() => _HealthInsuranceFormState();
}

class _HealthInsuranceFormState extends State<HealthInsuranceForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields to hold placeholder values
  final TextEditingController _householderController = TextEditingController();
  final TextEditingController _familyHeadInsuranceController =
      TextEditingController();
  final TextEditingController _familyMembersController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _toleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _identityCardController = TextEditingController();
  final TextEditingController _education1Controller = TextEditingController();
  final TextEditingController _education2Controller = TextEditingController();
  final TextEditingController _registrationDateController =
      TextEditingController();
  final TextEditingController _targetCategoryIdController =
      TextEditingController();
  final TextEditingController _contributionController = TextEditingController();
  final TextEditingController _signatureApplicantController =
      TextEditingController();
  final TextEditingController _signatureHelperController =
      TextEditingController();
  final TextEditingController _signatureCertifierController =
      TextEditingController();

  String? _gender;
  String? _relationship;
  String? _povertyLevel;
  bool _hivInfection = false;
  bool _mdrtv = false;
  bool _leprosy = false;
  bool _isSenior = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Household Information"),
            _buildTextField(
                controller: _householderController,
                label: 'Name of Householder',
                hint: 'Enter Householder Name'),
            _buildDropdown(
              label: 'Relationship with Family Head',
              value: _relationship,
              onChanged: (value) {
                setState(() {
                  _relationship = value;
                });
              },
              items: ['Self', 'Spouse', 'Child', 'Other'],
            ),
            _buildTextField(
                controller: _familyHeadInsuranceController,
                label: "Family Head's Insurance No.",
                hint: 'e.g., INS12345'),
            _buildTextField(
              controller: _familyMembersController,
              label: 'Number of Family Members',
              keyboardType: TextInputType.number,
              hint: 'e.g., 5',
            ),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Person Details"),
            _buildTextField(
              controller: _nameController,
              label: 'Name in English (Block Letters)',
              isCapitalized: true,
              hint: 'e.g., JOHN DOE',
            ),
            _buildDropdown(
              label: 'Gender',
              value: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              items: ['Male', 'Female', 'Other'],
            ),
            _buildTextField(
              controller: _dobController,
              label: 'Date of Birth',
              keyboardType: TextInputType.datetime,
              hint: 'MM/DD/YYYY',
            ),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        controller: _provinceController,
                        label: 'Province/State',
                        hint: 'Enter Province')),
                const SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        controller: _districtController,
                        label: 'District',
                        hint: 'Enter District')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        controller: _wardController,
                        label: 'Ward No.',
                        hint: 'Enter Ward No.')),
                const SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        controller: _toleController,
                        label: 'Tole No.',
                        hint: 'Enter Tole No.')),
              ],
            ),
            _buildTextField(
              controller: _phoneController,
              label: 'Telephone/Mobile No.',
              keyboardType: TextInputType.phone,
              hint: 'e.g., +9779812345678',
            ),
            _buildTextField(
                controller: _identityCardController,
                label: 'Identity Card No.',
                hint: 'Enter ID Card No.'),
            _buildTextField(
                controller: _education1Controller,
                label: 'Education 1',
                hint: 'e.g., High School'),
            _buildTextField(
                controller: _education2Controller,
                label: 'Education 2',
                hint: 'e.g., Bachelor\'s Degree'),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Registration Details"),
            _buildTextField(
              controller: _registrationDateController,
              label: 'Registration Date',
              keyboardType: TextInputType.datetime,
              hint: 'MM/DD/YYYY',
            ),
            _buildTextField(
                controller: _targetCategoryIdController,
                label: 'Target Category ID Card No.',
                hint: 'e.g., CAT123'),
            _buildTextField(
              controller: _contributionController,
              label: 'Contribution Amount',
              keyboardType: TextInputType.number,
              hint: 'e.g., 1000',
            ),
            _buildDropdown(
              label: 'Poverty Level',
              value: _povertyLevel,
              onChanged: (value) {
                setState(() {
                  _povertyLevel = value;
                });
              },
              items: ['Very Poor', 'Medium Poor', 'Poor'],
            ),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Health Conditions"),
            _buildCheckbox('HIV Infection', _hivInfection, (value) {
              setState(() {
                _hivInfection = value!;
              });
            }),
            _buildCheckbox('MDRTV', _mdrtv, (value) {
              setState(() {
                _mdrtv = value!;
              });
            }),
            _buildCheckbox('Leprosy', _leprosy, (value) {
              setState(() {
                _leprosy = value!;
              });
            }),
            _buildCheckbox('Senior/Old People', _isSenior, (value) {
              setState(() {
                _isSenior = value!;
              });
            }),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Approval and Signatures"),
            _buildTextField(
                controller: _signatureApplicantController,
                label: 'Signature of Applicant/Guardian',
                hint: 'Signature of Applicant'),
            _buildTextField(
                controller: _signatureHelperController,
                label: 'Signature of Helper/Assistant',
                hint: 'Signature of Helper'),
            _buildTextField(
                controller: _signatureCertifierController,
                label: 'Signature of Certifier',
                hint: 'Signature of Certifier'),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // You might want to gather form data and pass it to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HealthInsuranceFormConfirm(),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String hint = '',
    TextInputType keyboardType = TextInputType.text,
    bool isCapitalized = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: isCapitalized
          ? TextCapitalization.characters
          : TextCapitalization.none,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select $label';
        }
        return null;
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Widget _buildCheckbox(
      String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(label),
      ],
    );
  }
}
