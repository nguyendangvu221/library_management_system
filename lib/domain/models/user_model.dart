import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? address;
  final String? gender;
  final String? urlImage;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.gender,
    this.urlImage,
  });
}
