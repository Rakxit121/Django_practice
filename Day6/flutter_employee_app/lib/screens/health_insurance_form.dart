import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/heathcareconfirm.dart';
import 'package:get/get.dart';

class HealthInsuranceForm extends StatefulWidget {
  const HealthInsuranceForm({super.key});

  @override
  _HealthInsuranceFormState createState() => _HealthInsuranceFormState();
}

class _HealthInsuranceFormState extends State<HealthInsuranceForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields to hold placeholder values
  final TextEditingController _householderController =
      TextEditingController(text: 'John Doe'); // Static value input in all
  final TextEditingController _familyHeadInsuranceController =
      TextEditingController(text: 'INS123456789'); // Static value
  final TextEditingController _familyMembersController = TextEditingController(
      text: '3'); // Example static value for family members
  final TextEditingController _nameController =
      TextEditingController(text: 'Jane Doe'); // Static value
  final TextEditingController _dobController = TextEditingController(
      text: '1990-01-01'); // Static value for date of birth
  final TextEditingController _provinceController =
      TextEditingController(text: 'Province A'); // Static value for province
  final TextEditingController _districtController =
      TextEditingController(text: 'District B'); // Static value for district
  final TextEditingController _wardController =
      TextEditingController(text: 'Ward 1'); // Static value for ward
  final TextEditingController _toleController =
      TextEditingController(text: 'Tole X'); // Static value for tole
  final TextEditingController _phoneController =
      TextEditingController(text: '+1234567890'); // Static value for phone
  final TextEditingController _identityCardController = TextEditingController(
      text: 'ID123456789'); // Static value for identity card
  final TextEditingController _education1Controller = TextEditingController(
      text: 'Bachelor\'s Degree'); // Static value for education
  final TextEditingController _education2Controller = TextEditingController(
      text: 'Master\'s Degree'); // Static value for second education
  final TextEditingController _registrationDateController =
      TextEditingController(
          text: '2023-01-01'); // Static value for registration date
  final TextEditingController _targetCategoryIdController =
      TextEditingController(
          text: 'Category123'); // Static value for target category
  final TextEditingController _contributionController =
      TextEditingController(text: '1000'); // Static value for contribution
  final TextEditingController _signatureApplicantController =
      TextEditingController(
          text:
              'Signature of Applicant'); // Static value for applicant signature
  final TextEditingController _signatureHelperController =
      TextEditingController(
          text: 'Signature of Helper'); // Static value for helper signature
  final TextEditingController _signatureCertifierController =
      TextEditingController(
          text:
              'Signature of Certifier'); // Static value for certifier signature

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
            _buildSectionTitle("householder_name".tr), // localized
            _buildTextField(
              controller: _householderController,
              label: 'householder_name'.tr, // localized
              hint: 'enter_name'.tr,
              isReadOnly: true, // Static answer (read-only)
            ),
            const SizedBox(height: 10),
            _buildDropdown(
              label: 'relationship_with_householder'.tr, // localized
              value: _relationship,
              onChanged: (value) {
                setState(() {
                  _relationship = value;
                });
              },
              items: [
                'Self'.tr,
                'Spouse'.tr,
                'Child'.tr,
                'Other'.tr
              ], // localized
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _familyHeadInsuranceController,
              label: "homeowner_insurance_no".tr, // localized
              hint: 'e.g., INS12345',
              isReadOnly: true, // Static answer (read-only)
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _familyMembersController,
              label: 'member_details'.tr, // localized
              keyboardType: TextInputType.number,
              hint: 'e.g., 5',
            ),
            const SizedBox(height: 20.0),
            _buildSectionTitle("person_name_english".tr), // localized
            _buildTextField(
              controller: _nameController,
              label: 'person_name_english'.tr, // localized
              isCapitalized: true,
              hint: 'e.g., JOHN DOE',
            ),
            const SizedBox(height: 10),
            _buildDropdown(
              label: 'gender'.tr, // localized
              value: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              items: ['male'.tr, 'female'.tr, 'other'.tr], // localized
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _dobController,
              label: 'birth_date'.tr, // localized
              keyboardType: TextInputType.datetime,
              hint: 'MM/DD/YYYY',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _provinceController,
                    label: 'province'.tr, // localized
                    hint: 'province'.tr, // localized
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(
                    controller: _districtController,
                    label: 'District'.tr, // localized
                    hint: 'District',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _wardController,
                    label: 'Ward No.'.tr, // localized
                    hint: 'Ward No.',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(
                    controller: _toleController,
                    label: 'Tole No.'.tr, // localized
                    hint: 'Tole No.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _phoneController,
              label: 'phone_number'.tr, // localized
              keyboardType: TextInputType.phone,
              hint: 'e.g., +9779812345678',
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _identityCardController,
              label: 'identity_card_no'.tr, // localized
              hint: 'identity_card_no'.tr, // localized
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _education1Controller,
              label: 'education'.tr, // localized
              hint: 'e.g., High School',
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _education2Controller,
              label: 'education'.tr, // localized
              hint: 'e.g., Bachelor\'s Degree',
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20.0),
            _buildSectionTitle("registration_date".tr), // localized
            _buildTextField(
              controller: _registrationDateController,
              label: 'registration_date'.tr, // localized
              keyboardType: TextInputType.datetime,
              hint: 'MM/DD/YYYY',
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _targetCategoryIdController,
              label: 'id_card_no'.tr, // localized
              hint: 'e.g., CAT123',
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _contributionController,
              label: 'contribution_amount'.tr, // localized
              keyboardType: TextInputType.number,
              hint: 'e.g., 1000',
            ),
            const SizedBox(height: 10),
            _buildDropdown(
              label: 'poverty_level'.tr, // localized
              value: _povertyLevel,
              onChanged: (value) {
                setState(() {
                  _povertyLevel = value;
                });
              },
              items: [
                'very_poor'.tr, // localized
                'medium'.tr, // localized
                'big'.tr // localized
              ],
            ),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Health Conditions".tr), // localized
            _buildCheckbox('hiv_infection'.tr, _hivInfection, (value) {
              setState(() {
                _hivInfection = value!;
              });
            }),
            _buildCheckbox('mdr_tb'.tr, _mdrtv, (value) {
              setState(() {
                _mdrtv = value!;
              });
            }),
            _buildCheckbox('leprosy'.tr, _leprosy, (value) {
              setState(() {
                _leprosy = value!;
              });
            }),
            _buildCheckbox('ready_to_be_partner'.tr, _isSenior, (value) {
              setState(() {
                _isSenior = value!;
              });
            }),
            const SizedBox(height: 20.0),
            _buildSectionTitle("Approval and Signatures".tr), // localized
            _buildTextField(
              controller: _signatureApplicantController,
              label: 'applicant_signature'.tr, // localized
              hint: 'applicant_signature'.tr, // localized
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _signatureHelperController,
              label: 'donor_signature'.tr, // localized
              hint: 'Signature of Helper',
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _signatureCertifierController,
              label: 'donor_signature'.tr, // localized
              hint: 'donor_signature'.tr, // localized
            ),
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
    bool isReadOnly = false, // Added flag to handle read-only fields
  }) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly, // Make the field read-only if necessary
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
          return 'enter_label'.tr; // localized
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
          return 'please_select'.tr; // localized
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
