// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAccountsAdapter extends TypeAdapter<HiveAccounts> {
  @override
  final int typeId = 2;

  @override
  HiveAccounts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAccounts(
      code: fields[0] as String?,
      name: fields[1] as String?,
      password: fields[2] as String?,
      email: fields[3] as String?,
      isLogin: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAccounts obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.isLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAccountsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
