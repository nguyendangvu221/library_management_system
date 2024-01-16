import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
part 'hive_document.g.dart';

@HiveType(typeId: HiveTypeConstants.document)
class HiveDocument {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? author;
  @HiveField(3)
  String? idPoster;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? publisher;
  @HiveField(6)
  String? description;
  @HiveField(7)
  int? numberOfPage;
  @HiveField(8)
  int? reprint;
  @HiveField(9)
  int? numberOfEditions;
  @HiveField(10)
  String? language;
  @HiveField(11)
  DateTime? releaseDate;
  @HiveField(12)
  String? image;
  @HiveField(13)
  String? pdf;
  @HiveField(14)
  String? namePoster;
  HiveDocument({
    this.id,
    this.name,
    this.category,
    this.author,
    this.publisher,
    this.description,
    this.numberOfPage,
    this.reprint,
    this.numberOfEditions,
    this.releaseDate,
    this.image,
    this.language,
    this.pdf,
    this.idPoster,
    this.namePoster,
  });
}
