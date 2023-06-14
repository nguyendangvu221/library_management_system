import 'package:hive/hive.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
part 'hive_account.g.dart';

@HiveType(typeId: HiveTypeConstants.accounts)
class HiveAccounts {
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? email;
  @HiveField(4)
  bool? isLogin;
  HiveAccounts({
    this.code,
    this.name,
    this.password,
    this.email,
    this.isLogin,
  });
}
