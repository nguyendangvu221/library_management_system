// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_borrower.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBorrowerAdapter extends TypeAdapter<HiveBorrower> {
  @override
  final int typeId = 1;

  @override
  HiveBorrower read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBorrower(
      codeUser: fields[0] as String?,
      nameUser: fields[1] as String?,
      email: fields[2] as String?,
      borrowedDocument: (fields[3] as List?)?.cast<HiveBorrowedDocument>(),
      isLogin: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBorrower obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.codeUser)
      ..writeByte(1)
      ..write(obj.nameUser)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.borrowedDocument)
      ..writeByte(4)
      ..write(obj.isLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBorrowerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
