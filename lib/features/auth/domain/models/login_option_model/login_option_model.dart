
enum LoginOptionModel {
  viaPhoneNumber,
  viaDriverLicense;

  bool get isViaPhoneNumber => this == LoginOptionModel.viaPhoneNumber;
  bool get isViaDriverLicense => this == LoginOptionModel.viaDriverLicense;
}
