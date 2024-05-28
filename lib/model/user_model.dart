import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });
  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      "phone": phone,
    };
  }
}
