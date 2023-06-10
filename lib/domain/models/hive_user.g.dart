// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserAdapter extends TypeAdapter<HiveUser> {
  @override
  final int typeId = 0;

  @override
  HiveUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUser(
      codeUser: fields[0] as String?,
      nameUser: fields[1] as String?,
      email: fields[2] as String?,
      loanPeriod: fields[3] as String?,
      nameDocument: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.codeUser)
      ..writeByte(1)
      ..write(obj.nameUser)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.nameDocument)
      ..writeByte(4)
      ..write(obj.loanPeriod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
