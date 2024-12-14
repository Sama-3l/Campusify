// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  String username;
  String email;
  String password;
  String role;
  int yearOfJoining;
  List eventsRegistered;
  bool isVerified;
  List<int> otp;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.yearOfJoining,
    required this.eventsRegistered,
    required this.isVerified,
    required this.otp,
  });

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'username': username,
  //     'email': email,
  //     'password': password,
  //     'role': role,
  //     'yearOfJoining': yearOfJoining,
  //   };
  // }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      eventsRegistered: (map['eventsRegistered'] as List).map((e) => (e as String)).toList(),
      otp: (map['otp'] as List).map((e) => (e as int)).toList(),
      isVerified: map['isVerified'] as bool,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
      yearOfJoining: map['yearOfJoining'] as int,
    );
  }
}
