import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<String, UserEntity>> execute(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return const Left("All fields are required");
    }
    return await repository.register(name, email, password);
  }
}
