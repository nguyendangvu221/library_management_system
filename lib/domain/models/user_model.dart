import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  @JsonKey(fromJson: _timestampToDate, toJson: _dateToTimestamp)
  DateTime? dateOfBirth;
  String? address;
  String? gender;
  String? avatar;
  int? role;
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.gender,
    this.avatar,
    this.role,
  });
  static DateTime? _timestampToDate(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  static Timestamp? _dateToTimestamp(DateTime? date) {
    return date != null ? Timestamp.fromDate(date) : null;
  }
}
