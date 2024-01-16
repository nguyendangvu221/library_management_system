// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth:
          UserModel._timestampToDate(json['dateOfBirth'] as Timestamp?),
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': UserModel._dateToTimestamp(instance.dateOfBirth),
      'address': instance.address,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'role': instance.role,
    };
