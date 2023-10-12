import 'dart:convert';

LoginCredentials loginCredentialsFromJson(String str) =>
    LoginCredentials.fromJson(json.decode(str));

String loginCredentialsToJson(LoginCredentials data) =>
    json.encode(data.toJson());

class LoginCredentials {
  LoginCredentials({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  LoginCredentials copyWith({
    String? email,
    String? password,
  }) =>
      LoginCredentials(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory LoginCredentials.fromJson(Map<String, dynamic> json) =>
      LoginCredentials(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
