import 'package:flutter/material.dart';

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
  DateTime? releaseDate;
  DateTime? updateDate;
  Image? image;

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
  });
  Document.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    author = json['author'];
    category = json['category'];
    publisher = json['publisher'];
    description = json['description'];
    numberOfPage = json['numberOfPage'];
    language = json['language'];
    paperSize = json['paperSize'];
    reprint = json['reprint'];
    numberOfEditions = json['numberOfEditions'];
    releaseDate = json['releaseDate'];
    updateDate = json['updateDate'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['author'] = author;
    data['category'] = category;
    data['publisher'] = publisher;
    data['description'] = description;
    data['numberOfPage'] = numberOfPage;
    data['paperSize'] = paperSize;
    data['language'] = language;
    data['reprint'] = reprint;
    data['numberOfEditions'] = numberOfEditions;
    data['releaseDate'] = releaseDate;
    data['updateDate'] = updateDate;
    return data;
  }
}
