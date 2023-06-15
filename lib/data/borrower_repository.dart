import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrowed_document.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';

class BorrowerRepository {
  final HiveConfig hiveConfig;
  BorrowerRepository(this.hiveConfig);
  Future<void> addBorrower(HiveBorrower HiveBorrower) async {
    await hiveConfig.userBox.add(HiveBorrower);
  }

  Future<void> updateBorrower(HiveBorrower HiveBorrower, int index) async {
    await hiveConfig.userBox.putAt(index, HiveBorrower);
  }

  Future<void> deleteBorrower(int index) async {
    await hiveConfig.userBox.deleteAt(index);
  }

  List<HiveBorrower> getAllListBorrower() {
    List<HiveBorrower> listBorrower = [];
    for (int i = 0; i < hiveConfig.userBox.length; i++) {
      listBorrower.add(HiveBorrower(
        codeUser: hiveConfig.userBox.getAt(i)?.codeUser,
        email: hiveConfig.userBox.getAt(i)?.email,
        nameUser: hiveConfig.userBox.getAt(i)?.nameUser,
        borrowedDocument: hiveConfig.userBox.getAt(i)!.borrowedDocument,
      ));
    }
    return listBorrower;
  }

  bool? getIsLogin(int index) {
    return hiveConfig.userBox.getAt(index)?.isLogin;
  }

  String? getCode(int index) {
    return hiveConfig.userBox.getAt(index)?.codeUser;
  }

  String? getName(int index) {
    return hiveConfig.userBox.getAt(index)?.nameUser;
  }

  String? getEmail(int index) {
    return hiveConfig.userBox.getAt(index)?.email;
  }

  List<HiveBorrowedDocument>? getBorrowedDocument(int index) {
    return hiveConfig.userBox.getAt(index)?.borrowedDocument;
  }

  int getLength() {
    return hiveConfig.userBox.length;
  }
}
