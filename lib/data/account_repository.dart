import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/domain/models/document_model.dart';

class AccountRepository {
  final HiveConfig hiveConfig;
  AccountRepository(this.hiveConfig);

  Future<void> insertAccount(HiveAccounts) async {
    await hiveConfig.accountBox.add(HiveAccounts);
  }

  Future<void> updateAccount(HiveAccounts, int index) async {
    await hiveConfig.accountBox.putAt(index, HiveAccounts);
  }

  Future<void> deleteAccount(int index) async {
    await hiveConfig.accountBox.deleteAt(index);
  }

  String? getCode(int index) {
    return hiveConfig.accountBox.getAt(index)?.code;
  }

  String? getName(int index) {
    return hiveConfig.accountBox.getAt(index)?.name;
  }

  String? getEmail(int index) {
    return hiveConfig.accountBox.getAt(index)?.email;
  }

  String? getPassword(int index) {
    return hiveConfig.accountBox.getAt(index)?.password;
  }

  bool? getIsLogin(int index) {
    return hiveConfig.accountBox.getAt(index)?.isLogin;
  }

  int getLength() {
    return hiveConfig.accountBox.length;
  }

  bool compareToCode(int i, String code) {
    if (hiveConfig.accountBox.values.elementAt(i).code == code) return true;
    return false;
  }
}
