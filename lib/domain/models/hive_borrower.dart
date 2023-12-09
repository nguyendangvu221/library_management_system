import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrowed_document.dart';
part 'hive_borrower.g.dart';

@HiveType(typeId: HiveTypeConstants.borrower)
class HiveBorrower {
  @HiveField(0)
  String? codeUser;
  @HiveField(1)
  String? nameUser;
  @HiveField(2)
  String? email;
  @HiveField(3)
  List<HiveBorrowedDocument>? borrowedDocument;
  @HiveField(4)
  bool? isLogin;

  HiveBorrower({
    this.codeUser,
    this.nameUser,
    this.email,
    this.borrowedDocument,
    this.isLogin,
  });
}
