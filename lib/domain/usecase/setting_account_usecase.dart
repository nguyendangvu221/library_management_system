import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/data/setting_account_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class SettingAccountUseCase {
  final SettingAccountRepository _repository;

  SettingAccountUseCase(this._repository);

  Future<User?> getCurrentUser() async {
    return _repository.getCurrentUser();
  }

  Future<UserModel> getUserById() {
    return _repository.getUserById();
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String avatar,
    required String gender,
    required DateTime dateOfBirth,
  }) async {
    await _repository.updateProfile(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      avatar: avatar,
      gender: gender,
      dateOfBirth: dateOfBirth,
    );
  }
}
