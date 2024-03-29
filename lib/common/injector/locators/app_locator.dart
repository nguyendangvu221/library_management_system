import 'package:get_it/get_it.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/common/config/network/dio_client.dart';
import 'package:library_management_system/data/add_book_repository.dart';
import 'package:library_management_system/data/chat_repository.dart';
import 'package:library_management_system/data/home_repository.dart';
import 'package:library_management_system/data/login_repository.dart';
import 'package:library_management_system/data/manage_document_posted_repository.dart';
import 'package:library_management_system/data/manage_document_repository.dart';
import 'package:library_management_system/data/register_repository.dart';
import 'package:library_management_system/data/search_repository.dart';
import 'package:library_management_system/data/setting_account_repository.dart';
import 'package:library_management_system/data/setting_repository.dart';
import 'package:library_management_system/data/user_repository.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:library_management_system/domain/usecase/chat_usecase.dart';
import 'package:library_management_system/domain/usecase/home_usecase.dart';
import 'package:library_management_system/domain/usecase/login_usecase.dart';
import 'package:library_management_system/domain/usecase/manage_document_posted_usecase.dart';
import 'package:library_management_system/domain/usecase/manage_document_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';
import 'package:library_management_system/domain/usecase/search_usecase.dart';
import 'package:library_management_system/domain/usecase/setting_account_usecase.dart';
import 'package:library_management_system/domain/usecase/setting_usecase.dart';
import 'package:library_management_system/domain/usecase/user_usecase.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/journey/chat/chat_controller.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
import 'package:library_management_system/presentation/journey/manage_document/manage_document_controller.dart';
import 'package:library_management_system/presentation/journey/manage_document_posted/manager_document_posted_controller.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/journey/setting_account/setting_account_controller.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';
import 'package:library_management_system/presentation/journey/setting/setting_controller.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  //controller
  getIt.registerLazySingleton(() => AppController());
  getIt.registerFactory<SplashController>(
    () => SplashController(),
  );
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(),
  );
  getIt.registerFactory<MainController>(
    () => MainController(),
  );
  getIt.registerFactory<HomeController>(
    () => HomeController(
      homeUsecase: getIt<HomeUsecase>(),
    ),
  );
  getIt.registerFactory<LoginController>(
    () => LoginController(),
  );
  getIt.registerFactory<RegisterController>(
    () => RegisterController(),
  );
  getIt.registerFactory<SearchsController>(
    () => SearchsController(
      searchUsecase: getIt<SearchUsecase>(),
    ),
  );
  getIt.registerFactory<UserController>(() => UserController(
        userUsecase: getIt<UserUsecase>(),
      ));
  getIt.registerFactory<AddBookController>(
    () => AddBookController(
      addBookUsecase: getIt<AddBookUsecase>(),
    ),
  );
  getIt.registerFactory<SettingController>(
    () => SettingController(
      settingUsecase: getIt<SettingUsecase>(),
    ),
  );
  getIt.registerFactory<ChatController>(
    () => ChatController(
      chatUsecase: getIt<ChatUsecase>(),
    ),
  );
  getIt.registerFactory<SettingAccountController>(
    () => SettingAccountController(
      settingAccountUseCase: getIt<SettingAccountUseCase>(),
    ),
  );
  getIt.registerFactory<ManageDocumentPostedController>(
    () => ManageDocumentPostedController(
      manageDocumentPostedUsecase: getIt<ManageDocumentPostedUsecase>(),
    ),
  );
  getIt.registerFactory<ManageDocumentController>(
    () => ManageDocumentController(
      manageDocumentUsecase: getIt<ManageDocumentUsecase>(),
    ),
  );

  //usecase
  getIt.registerFactory<HomeUsecase>(
    () => HomeUsecase(
      getIt<HomeRepository>(),
    ),
  );
  getIt.registerFactory<UserUsecase>(
    () => UserUsecase(
      userRepository: getIt<UserRepository>(),
    ),
  );
  getIt.registerFactory<AddBookUsecase>(
    () => AddBookUsecase(
      addBookRepository: getIt<AddBookRepository>(),
    ),
  );
  getIt.registerFactory<SettingUsecase>(
    () => SettingUsecase(
      settingRepository: getIt<SettingRepository>(),
    ),
  );
  getIt.registerFactory<ChatUsecase>(
    () => ChatUsecase(
      chatRepository: getIt<ChatRepository>(),
    ),
  );
  getIt.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(
      registerRepository: getIt<RegisterRepository>(),
    ),
  );
  getIt.registerFactory<SearchUsecase>(
    () => SearchUsecase(
      searchRepository: getIt<SearchRepository>(),
    ),
  );
  getIt.registerFactory<LoginUsecase>(
    () => LoginUsecase(
      loginRepository: getIt<LoginRepository>(),
    ),
  );
  getIt.registerFactory<SettingAccountUseCase>(
    () => SettingAccountUseCase(
      getIt<SettingAccountRepository>(),
    ),
  );
  getIt.registerFactory<ManageDocumentPostedUsecase>(
    () => ManageDocumentPostedUsecase(
      manageDocumentPostedRepository: getIt<ManageDocumentPostedRepository>(),
    ),
  );
  getIt.registerFactory<ManageDocumentUsecase>(
    () => ManageDocumentUsecase(
      manageDocumentRepository: getIt<ManageDocumentRepository>(),
    ),
  );

  //repository
  getIt.registerFactory<HomeRepository>(
    () => HomeRepository(
      hiveConfig: getIt<HiveConfig>(),
      dioClient: getIt<DioClient>(),
    ),
  );
  getIt.registerFactory<SearchRepository>(() => SearchRepository(
        hiveConfig: getIt<HiveConfig>(),
        dioClient: getIt<DioClient>(),
      ));
  getIt.registerFactory<UserRepository>(
    () => UserRepository(),
  );
  getIt.registerFactory<SettingRepository>(
    () => SettingRepository(),
  );
  getIt.registerFactory<ChatRepository>(
    () => ChatRepository(),
  );
  getIt.registerFactory<RegisterRepository>(
    () => RegisterRepository(),
  );
  getIt.registerFactory<AddBookRepository>(() => AddBookRepository(
        dioClient: getIt<DioClient>(),
      ));
  getIt.registerFactory<SettingAccountRepository>(
    () => SettingAccountRepository(),
  );
  getIt.registerFactory<ManageDocumentPostedRepository>(
    () => ManageDocumentPostedRepository(
      hiveConfig: getIt<HiveConfig>(),
      dioClient: getIt<DioClient>(),
    ),
  );
  getIt.registerFactory<ManageDocumentRepository>(
    () => ManageDocumentRepository(
      hiveConfig: getIt<HiveConfig>(),
      dioClient: getIt<DioClient>(),
    ),
  );

  getIt.registerLazySingleton<HiveConfig>(
    () => HiveConfig(),
  );
}
