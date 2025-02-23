// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String jwt;
  User user;

  LoginModel({
    required this.jwt,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    jwt: json["jwt"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "jwt": jwt,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  DateTime createdAt;
  DateTime updatedAt;
  String investorType;
  dynamic fcmToken;
  dynamic mobileNo;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic resetPasswordOtp;
  dynamic deletedAt;
  dynamic externalProfilePictureUrl;
  dynamic addressLine1;
  dynamic addressLine2;
  String fullName;
  dynamic ibkrOnboardingFinished;
  dynamic guidedInvestingFinished;
  dynamic customiseClimatePortfolio;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.investorType,
    required this.fcmToken,
    required this.mobileNo,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.resetPasswordOtp,
    required this.deletedAt,
    required this.externalProfilePictureUrl,
    required this.addressLine1,
    required this.addressLine2,
    required this.fullName,
    required this.ibkrOnboardingFinished,
    required this.guidedInvestingFinished,
    required this.customiseClimatePortfolio,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    provider: json["provider"],
    confirmed: json["confirmed"],
    blocked: json["blocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    investorType: json["investor_type"],
    fcmToken: json["fcm_token"],
    mobileNo: json["mobile_no"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    resetPasswordOtp: json["reset_password_otp"],
    deletedAt: json["deleted_at"],
    externalProfilePictureUrl: json["external_profile_picture_url"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    fullName: json["full_name"],
    ibkrOnboardingFinished: json["ibkr_onboarding_finished"],
    guidedInvestingFinished: json["guided_investing_finished"],
    customiseClimatePortfolio: json["customise_climate_portfolio"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "provider": provider,
    "confirmed": confirmed,
    "blocked": blocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "investor_type": investorType,
    "fcm_token": fcmToken,
    "mobile_no": mobileNo,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "reset_password_otp": resetPasswordOtp,
    "deleted_at": deletedAt,
    "external_profile_picture_url": externalProfilePictureUrl,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "full_name": fullName,
    "ibkr_onboarding_finished": ibkrOnboardingFinished,
    "guided_investing_finished": guidedInvestingFinished,
    "customise_climate_portfolio": customiseClimatePortfolio,
  };
}
