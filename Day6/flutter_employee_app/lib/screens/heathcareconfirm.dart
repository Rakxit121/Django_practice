import 'package:flutter/material.dart';

class HealthInsuranceFormConfirm extends StatelessWidget {
  const HealthInsuranceFormConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Insurance Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Government of Nepal\nHealth Insurance Board",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Text("State/Province"),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 8),
              const Text("Identity Card"),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Expanded(child: Text("Insurance No.")),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextField(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: "Full Name"),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Address Province"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "District"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Toll or Road No."),
              ),
              const SizedBox(height: 16),
              const Text("Gender"),
              Row(
                children: [
                  Radio(
                      value: "Male",
                      groupValue: "gender",
                      onChanged: (value) {}),
                  const Text("Male"),
                  Radio(
                      value: "Female",
                      groupValue: "gender",
                      onChanged: (value) {}),
                  const Text("Female"),
                  Radio(
                      value: "Other",
                      groupValue: "gender",
                      onChanged: (value) {}),
                  const Text("Other"),
                ],
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: "First Service Point"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "First Hospital"),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Citizen Slip or ID Card Register Date",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Contact No."),
              ),
              const SizedBox(height: 16),
              const Text("Insured Signature"),
              Container(
                height: 50,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 16),
              const Text("Left"),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("Right"),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "Toll free no. 1660-01-1122U",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "In case of unauthorized use of this identity card,\nit will be governed in accordance with...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement next button action here
                  },
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
