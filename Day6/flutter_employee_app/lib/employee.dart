class Employee {
  String name;
  String employeeId;
  int gender;
  String phone;
  String email;
  int status;
  String qualification;

  Employee({
    required this.name,
    required this.employeeId,
    required this.gender,
    required this.phone,
    required this.email,
    required this.status,
    required this.qualification,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'employee_id': employeeId,
      'gender': gender,
      'phone': phone,
      'email': email,
      'status': status,
      'qualification': qualification,
    };
  }
}
