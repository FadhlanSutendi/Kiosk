import 'package:get/get.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/controllers/login_controller.dart';
import '../../features/auth/presentation/controllers/register_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Data Source
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

    // Repository
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: Get.find()));

    // UseCases
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => RegisterUseCase(Get.find()));

    // Controllers
    Get.lazyPut(() => LoginController(loginUseCase: Get.find()));
    Get.lazyPut(() => RegisterController(registerUseCase: Get.find()));
  }
}
