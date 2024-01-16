import 'package:library_management_system/data/setting_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class SettingUsecase {
  final SettingRepository settingRepository;

  SettingUsecase({required this.settingRepository});

  Future<String?>? getUserNameByEmail(String email) async {
    return await settingRepository.getFullNameByEmail(email);
  }

  Future<UserModel> getUserById() {
    return settingRepository.getUserById();
  }
}
