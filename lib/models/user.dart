import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String telefone;
  final String renda;
  final String type;
  final String token;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.telefone,
      required this.renda,
      required this.type,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'telefone': telefone,
      'renda': renda,
      'type': type,
      'tokern': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      telefone: map['telefone'] ?? '',
      renda: map['renda'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
