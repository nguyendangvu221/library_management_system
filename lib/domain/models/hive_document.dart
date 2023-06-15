import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
part 'hive_document.g.dart';

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
  String? description;
  @HiveField(6)
  int? numberOfPage;
  @HiveField(7)
  String? paperSize;
  @HiveField(8)
  String? reprint;
  @HiveField(9)
  int? numberOfEditions;
  @HiveField(10)
  String? releaseDate;
  @HiveField(11)
  String? updateDate;
  @HiveField(12)
  String? image;
  @HiveField(13)
  String? language;
  @HiveField(14)
  bool? isBorrowed;
  HiveDocument({
    this.name,
    this.code,
    this.category,
    this.author,
    this.publisher,
    this.description,
    this.numberOfPage,
    this.paperSize,
    this.reprint,
    this.numberOfEditions,
    this.releaseDate,
    this.updateDate,
    this.image,
    this.language,
    this.isBorrowed,
  });
}
