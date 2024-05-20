class LoginFormModel {
  final String? email;
  final String? password;
  final String? phone;
  final String? licenseImage;
  final String? countryCode;

  LoginFormModel({
    this.email,
    this.password,
    this.phone,
    this.licenseImage,
    this.countryCode,
  });

  factory LoginFormModel.initial() {
    return LoginFormModel();
  }

  LoginFormModel copyWith({
    String? email,
    String? password,
    String? phone,
    String? licenseImage,
    String? countryCode,
  }) {
    return LoginFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      licenseImage: licenseImage ?? this.licenseImage,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
