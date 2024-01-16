import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable()
class Document {
  String? id;
  final String? name;
  final String? author;
  final String? idPoster;
  final String? category;
  final String? publisher;
  final String? description;
  final int? numberOfPage;
  final int? reprint;
  final int? numberOfEditions;
  final String? language;
  final DateTime? releaseDate;
  final String? image;
  final String? pdf;
  final String? namePoster;
  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
  Document({
    this.id,
    this.name,
    this.author,
    this.idPoster,
    this.category,
    this.publisher,
    this.description,
    this.numberOfPage,
    this.reprint,
    this.numberOfEditions,
    this.language,
    this.releaseDate,
    this.image,
    this.pdf,
    this.namePoster,
  });
}
