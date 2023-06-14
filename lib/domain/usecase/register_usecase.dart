import 'package:library_management_system/data/account_repository.dart';
import 'package:library_management_system/domain/models/account_model.dart';
import 'package:library_management_system/domain/models/hive_account.dart';

class RegisterUseCase {
  final AccountRepository accountRepository;
  RegisterUseCase(this.accountRepository);

  Future<void> addAccount(HiveAccounts HiveAccounts) async {
    return await accountRepository.insertAccount(HiveAccounts);
  }

  Future<void> updateAccount(HiveAccounts HiveAccounts, int index) async {
    return await accountRepository.updateAccount(HiveAccounts, index);
  }

  Future<void> deleteAccount(int index) async {
    return await accountRepository.deleteAccount(index);
  }

  String? getCode(int index) {
    return accountRepository.getCode(index);
  }

  String? getName(int index) {
    return accountRepository.getName(index);
  }

  String? getEmail(int index) {
    return accountRepository.getEmail(index);
  }

  String? getPassword(int index) {
    return accountRepository.getPassword(index);
  }

  bool? getIsLogin(int index) {
    return accountRepository.getIsLogin(index);
  }

  int getLength() {
    return accountRepository.getLength();
  }

  bool compareToCode(int i, String code) {
    return accountRepository.compareToCode(i, code);
  }
}
