class UserRegisterModel {
  final String name;
  final String email;
  final String password;
  final String gender;
  final int age;
  final int tall;
  final int weight;

  UserRegisterModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.age,
      required this.tall,
      required this.weight});

  factory UserRegisterModel.fromJson(Map<String, dynamic> jsondata) {
    return UserRegisterModel(
      name: jsondata['name'],
      email: jsondata['email'],
      password: jsondata['password'],
      gender: jsondata['gender'],
      age: jsondata['age'],
      tall: jsondata['tall'],
      weight: jsondata['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
      'tall': tall,
      'weight': weight,
    };
  }
}