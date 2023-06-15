// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_borrowed_document.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBorrowedDocumentAdapter extends TypeAdapter<HiveBorrowedDocument> {
  @override
  final int typeId = 3;

  @override
  HiveBorrowedDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBorrowedDocument(
      idDocument: fields[0] as String?,
      nameDocument: fields[1] as String?,
      loanPeriod: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBorrowedDocument obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.idDocument)
      ..writeByte(1)
      ..write(obj.nameDocument)
      ..writeByte(2)
      ..write(obj.loanPeriod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBorrowedDocumentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
