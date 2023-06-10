import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
part 'hive_user.g.dart';

@HiveType(typeId: 0)
class HiveUser {
  @HiveField(0)
  String? codeUser;
  @HiveField(1)
  String? nameUser;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? nameDocument;
  @HiveField(4)
  String? loanPeriod;
  @HiveField(5)
  String? idDocument;

  HiveUser({
    this.codeUser,
    this.nameUser,
    this.email,
    this.loanPeriod,
    this.nameDocument,
    this.idDocument,
  });
}
