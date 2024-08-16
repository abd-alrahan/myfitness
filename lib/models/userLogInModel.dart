class UserLogInModel {
  final String email;
  final String password;
  final String? token;

  UserLogInModel({required this.email, required this.password, this.token});

  factory UserLogInModel.fromJson(Map<String, dynamic> jsondata) {
    return UserLogInModel(
      email: jsondata['email'],
      password: jsondata['password'],
      token: jsondata['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'token': token
    };
  }
}
