import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable()
class Document {
  String? code;
  String? name;
  String? author;
  String? category;
  String? publisher;
  String? description;
  int? numberOfPage;
  String? paperSize;
  String? reprint;
  int? numberOfEditions;
  String? language;
  String? releaseDate;
  String? updateDate;
  String? image;
  String? pdf;
  String? postedBy;
  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
  Document({
    this.code,
    this.name,
    this.author,
    this.category,
    this.publisher,
    this.description,
    this.numberOfPage,
    this.paperSize,
    this.reprint,
    this.language,
    this.numberOfEditions,
    this.releaseDate,
    this.updateDate,
    this.image,
    this.pdf,
  });
}
