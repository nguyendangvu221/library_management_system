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
      description: fields[5] as String?,
      numberOfPage: fields[6] as int?,
      paperSize: fields[7] as String?,
      reprint: fields[8] as String?,
      numberOfEditions: fields[9] as int?,
      releaseDate: fields[10] as String?,
      updateDate: fields[11] as String?,
      image: fields[12] as String?,
      language: fields[13] as String?,
      isBorrowed: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDocument obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.numberOfPage)
      ..writeByte(7)
      ..write(obj.paperSize)
      ..writeByte(8)
      ..write(obj.reprint)
      ..writeByte(9)
      ..write(obj.numberOfEditions)
      ..writeByte(10)
      ..write(obj.releaseDate)
      ..writeByte(11)
      ..write(obj.updateDate)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.language)
      ..writeByte(14)
      ..write(obj.isBorrowed);
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
