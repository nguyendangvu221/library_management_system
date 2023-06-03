import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
// part 'hive_document.g.dart';

@HiveType(typeId: HiveTypeConstants.document)
class HiveDocument {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? author;
  @HiveField(3)
  String? category;
  @HiveField(4)
  String? publisher;
  @HiveField(5)
  String? yearPublication;
  @HiveField(6)
  String? description;
  @HiveField(7)
  int? numberOfPage;
  @HiveField(8)
  String? paperSize;
  @HiveField(9)
  String? reprint;
  @HiveField(10)
  int? numberOfEditions;
  @HiveField(11)
  DateTime? releaseDate;
  @HiveField(12)
  DateTime? updateDate;
  @HiveField(13)
  Image? image;
  HiveDocument({
    this.name,
    this.code,
    this.category,
    this.author,
    this.publisher,
    this.yearPublication,
    this.description,
    this.numberOfPage,
    this.paperSize,
    this.reprint,
    this.numberOfEditions,
    this.releaseDate,
    this.updateDate,
    this.image,
  });
}
