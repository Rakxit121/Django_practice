import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthInsuranceFormConfirm extends StatelessWidget {
  const HealthInsuranceFormConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("health_insurance_form".tr), // localized
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "${"government_of_nepal".tr}\n${"health_insurance_board".tr}", // localized
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text("state_province".tr), // localized
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 8),
              Text("identity_card".tr), // localized
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: Text("insurance_no".tr)), // localized
                  const SizedBox(width: 4),
                  const Expanded(
                    child: TextField(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Full Name"), // needs localization
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "date_of_birth".tr, // localized
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "address_province".tr), // localized
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: "district".tr), // localized
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: "toll_road_no".tr), // localized
              ),
              const SizedBox(height: 16),
              Text("gender".tr), // localized
              Row(
                children: [
                  Radio(
                      value: "male".tr, // localized
                      groupValue: "gender",
                      onChanged: (value) {}),
                  Text("male".tr), // localized
                  Radio(
                      value: "female".tr, // localized
                      groupValue: "gender",
                      onChanged: (value) {}),
                  Text("female".tr), // localized
                  Radio(
                      value: "other".tr, // localized
                      groupValue: "gender",
                      onChanged: (value) {}),
                  Text("other".tr), // localized
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                    labelText: "first_service_point".tr), // localized
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "first_hospital".tr), // localized
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "citizen_slip_register_date".tr, // localized
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: "contact_no".tr), // localized
              ),
              const SizedBox(height: 16),
              Text("insured_signature".tr), // localized
              Container(
                height: 50,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 16),
              Text("left".tr), // localized
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("right".tr), // localized
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "toll_free_no".tr, // localized
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "unauthorized_use_warning".tr, // localized
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Text(
                              "form_submitted_successfully".tr), // localized
                        );
                      },
                    );
                  },
                  child: Text("submit".tr), // localized
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
