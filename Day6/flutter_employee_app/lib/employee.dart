class Employee {
  String name;
  String employeeId;
  int gender; // 1 for Male, 2 for Female, 3 for Other
  String phone;
  String email;
  String level;
  int status; // 0 for Active, 1 for Terminated, 2 for Present
  String?
      qualificationPath; // Updated to store the path of the qualification file

  Employee({
    required this.name,
    required this.employeeId,
    required this.gender,
    required this.phone,
    required this.email,
    required this.level,
    required this.status,
    this.qualificationPath, // Make this nullable
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'employee_id': employeeId,
      'gender': gender,
      'phone': phone,
      'email': email,
      'level': level,
      'status': status,
      'qualification': qualificationPath, // Updated to use the path
    };
  }
}
