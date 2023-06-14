import 'package:get_it/get_it.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/data/account_repository.dart';
import 'package:library_management_system/data/borrower_repository.dart';
import 'package:library_management_system/data/document_repository.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  //controller
  getIt.registerLazySingleton(() => AppController());
  getIt.registerFactory<SplashController>(() => SplashController());
  getIt.registerFactory<MainController>(() => MainController());
  getIt.registerFactory<HomeController>(() => HomeController(
        addBookUsecase: getIt<AddBookUsecase>(),
      ));
  getIt.registerFactory<LoginController>(() => LoginController(
        registerUseCase: getIt<RegisterUseCase>(),
      ));
  getIt.registerFactory<RegisterController>(() => RegisterController(
        borrowerUsecase: getIt<BorrowerUsecase>(),
        registerUseCase: getIt<RegisterUseCase>(),
      ));
  getIt.registerFactory<SearchsController>(() => SearchsController());
  getIt.registerFactory<BorrowerController>(() => BorrowerController());
  getIt.registerFactory<AddBookController>(
    () => AddBookController(
      addBookUsecase: getIt<AddBookUsecase>(),
    ),
  );
  getIt.registerFactory<UserController>(() => UserController(
        registerUseCase: getIt<RegisterUseCase>(),
      ));

  //usecase
  getIt.registerFactory(
    () => AddBookUsecase(
      getIt<DocumentRepository>(),
    ),
  );
  getIt.registerFactory(
    () => RegisterUseCase(
      getIt<AccountRepository>(),
    ),
  );
  getIt.registerFactory(
    () => BorrowerUsecase(
      getIt<BorrowerRepository>(),
    ),
  );

  //repository
  getIt.registerFactory<AccountRepository>(
    () => AccountRepository(
      getIt<HiveConfig>(),
    ),
  );
  getIt.registerFactory(
    () => BorrowerRepository(
      getIt<HiveConfig>(),
    ),
  );
  getIt.registerFactory(
    () => DocumentRepository(
      getIt<HiveConfig>(),
    ),
  );
  getIt.registerLazySingleton<HiveConfig>(
    () => HiveConfig(),
  );
}
