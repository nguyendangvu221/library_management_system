// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String?,
      name: json['name'] as String?,
      author: json['author'] as String?,
      idPoster: json['idPoster'] as String?,
      category: json['category'] as String?,
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      numberOfPage: json['numberOfPage'] as int?,
      reprint: json['reprint'] as int?,
      numberOfEditions: json['numberOfEditions'] as int?,
      language: json['language'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      image: json['image'] as String?,
      pdf: json['pdf'] as String?,
      namePoster: json['namePoster'] as String?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'idPoster': instance.idPoster,
      'category': instance.category,
      'publisher': instance.publisher,
      'description': instance.description,
      'numberOfPage': instance.numberOfPage,
      'reprint': instance.reprint,
      'numberOfEditions': instance.numberOfEditions,
      'language': instance.language,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'image': instance.image,
      'pdf': instance.pdf,
      'namePoster': instance.namePoster,
    };
