import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (email == "admin@hospital.com" && password == "admin123") {
      return UserModel(
        id: "1",
        email: email,
        name: "Hospital Admin",
        role: "admin",
      );
    } else {
      throw "Invalid email or password";
    }
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      role: "doctor", // Default role for registration example
    );
  }
}
