// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      code: json['code'] as String?,
      name: json['name'] as String?,
      author: json['author'] as String?,
      category: json['category'] as String?,
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      numberOfPage: json['numberOfPage'] as int?,
      paperSize: json['paperSize'] as String?,
      reprint: json['reprint'] as String?,
      language: json['language'] as String?,
      numberOfEditions: json['numberOfEditions'] as int?,
      releaseDate: json['releaseDate'] as String?,
      updateDate: json['updateDate'] as String?,
      image: json['image'] as String?,
      pdf: json['pdf'] as String?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'author': instance.author,
      'category': instance.category,
      'publisher': instance.publisher,
      'description': instance.description,
      'numberOfPage': instance.numberOfPage,
      'paperSize': instance.paperSize,
      'reprint': instance.reprint,
      'numberOfEditions': instance.numberOfEditions,
      'language': instance.language,
      'releaseDate': instance.releaseDate,
      'updateDate': instance.updateDate,
      'image': instance.image,
      'pdf': instance.pdf,
    };
