import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  RegisterController({required this.registerUseCase});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final result = await registerUseCase.execute(
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text,
    );

    isLoading.value = false;

    result.fold(
      (failure) {
        Get.snackbar(
          "Registration Failed",
          failure,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          borderRadius: 12,
          margin: const EdgeInsets.all(16),
        );
      },
      (user) {
        Get.snackbar(
          "Account Created",
          "Welcome to MediFlow Pro, ${user.name}!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          borderRadius: 12,
          margin: const EdgeInsets.all(16),
        );
        Get.offAllNamed('/home');
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
