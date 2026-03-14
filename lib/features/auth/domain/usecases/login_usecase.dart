import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, UserEntity>> execute(String email, String password) async {
    // Basic validation can be added here if needed, or in the presentation layer
    if (email.isEmpty || password.isEmpty) {
      return const Left("Email and password cannot be empty");
    }
    return await repository.login(email, password);
  }
}
