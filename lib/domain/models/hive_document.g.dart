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
      id: fields[0] as String?,
      name: fields[1] as String?,
      category: fields[4] as String?,
      author: fields[2] as String?,
      publisher: fields[5] as String?,
      description: fields[6] as String?,
      numberOfPage: fields[7] as int?,
      reprint: fields[8] as int?,
      numberOfEditions: fields[9] as int?,
      releaseDate: fields[11] as DateTime?,
      image: fields[12] as String?,
      language: fields[10] as String?,
      pdf: fields[13] as String?,
      idPoster: fields[3] as String?,
      namePoster: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDocument obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.idPoster)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.publisher)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.numberOfPage)
      ..writeByte(8)
      ..write(obj.reprint)
      ..writeByte(9)
      ..write(obj.numberOfEditions)
      ..writeByte(10)
      ..write(obj.language)
      ..writeByte(11)
      ..write(obj.releaseDate)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.pdf)
      ..writeByte(14)
      ..write(obj.namePoster);
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
