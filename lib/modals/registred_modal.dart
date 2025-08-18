class RegisterUsers {
  final bool status;
  final String message;
  final String mobile;

  RegisterUsers({
    required this.status,
    required this.message,
    required this.mobile,
  });

  factory RegisterUsers.fromJson(Map<String, dynamic> json) {
    return RegisterUsers(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'mobile': mobile,
    };
  }
}
