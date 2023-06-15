import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
part 'hive_borrowed_document.g.dart';

@HiveType(typeId: HiveTypeConstants.borrowedDocument)
class HiveBorrowedDocument {
  @HiveField(0)
  String? idDocument;
  @HiveField(1)
  String? nameDocument;
  @HiveField(2)
  String? loanPeriod;

  HiveBorrowedDocument({
    this.idDocument,
    this.nameDocument,
    this.loanPeriod,
  });
}
