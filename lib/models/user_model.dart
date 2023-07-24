import 'package:tracking/utils/importer.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String number;
  final bool? isEmailVerified;
  final String email;
  final String status;
  const User({
    required this.number,
    required this.isEmailVerified,
    required this.status,
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      number: json['number'],
      isEmailVerified: json['isEmailVerified'],
      status: json['status'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
  toJson(String email, String pass) {
    return JsonEncoder((obj) => {'email': email, 'password': pass});
  }

  @override
  List<Object?> get props => [
        id,
        name,
        number,
        email,
        status,
        isEmailVerified,
      ];
}

// dynamic x = {
//   "user_code": "230002",
//   "status": "1",
//   "created_at": "2023-06-21T11:26:07.000000Z",
//   "updated_at": "2023-06-21T11:26:07.000000Z",
// };
