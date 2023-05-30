// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_document.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDocumentAdapter extends TypeAdapter<HiveDocument> {
  @override
  final int typeId = 0;

  @override
  HiveDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDocument(
      name: fields[0] as String?,
      code: fields[1] as String?,
      category: fields[3] as String?,
      author: fields[2] as String?,
      publisher: fields[4] as String?,
      yearPublication: fields[5] as String?,
      description: fields[6] as String?,
      numberOfPage: fields[7] as int?,
      paperSize: fields[8] as String?,
      reprint: fields[9] as String?,
      numberOfEditions: fields[10] as int?,
      releaseDate: fields[11] as DateTime?,
      updateDate: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDocument obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.publisher)
      ..writeByte(5)
      ..write(obj.yearPublication)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.numberOfPage)
      ..writeByte(8)
      ..write(obj.paperSize)
      ..writeByte(9)
      ..write(obj.reprint)
      ..writeByte(10)
      ..write(obj.numberOfEditions)
      ..writeByte(11)
      ..write(obj.releaseDate)
      ..writeByte(12)
      ..write(obj.updateDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDocumentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
