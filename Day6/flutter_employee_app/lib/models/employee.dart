class Employee {
  String name;
  String employeeId;
  int gender; // 1 for Male, 2 for Female, 3 for Other
  String phone;
  String email;
  String level;
  int status; // 0 for Active, 1 for Terminated, 2 for Present
  String? qualificationPath; // Path of the qualification file
  String? profilePicPath; // Nullable field for storing profile picture path

  Employee({
    required this.name,
    required this.employeeId,
    required this.gender,
    required this.phone,
    required this.email,
    required this.level,
    required this.status,
    this.qualificationPath, // Nullable
    this.profilePicPath, // Nullable profile picture path
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
      'qualification': qualificationPath,
      'profilePic': profilePicPath, // Added profile pic to JSON
    };
  }
}
