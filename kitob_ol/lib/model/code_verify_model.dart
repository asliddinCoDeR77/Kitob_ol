class CodeVerificationModel {
  final String phone;
  final String verificationCode;

  CodeVerificationModel({required this.phone, required this.verificationCode});

  factory CodeVerificationModel.fromJson(Map<String, dynamic> json) {
    return CodeVerificationModel(
      phone: json['phone'],
      verificationCode: json['verificationCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'verificationCode': verificationCode,
    };
  }
}
