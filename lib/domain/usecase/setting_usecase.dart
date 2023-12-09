import 'package:library_management_system/data/setting_repository.dart';

class SettingUsecase {
  final SettingRepository settingRepository;

  SettingUsecase({required this.settingRepository});

  Future<String?>? getUserNameByEmail(String email) async {
    return await settingRepository.getFullNameByEmail(email);
  }
}
