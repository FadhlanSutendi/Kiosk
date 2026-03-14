import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/main_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back, color: Colors.black))),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                child: const Icon(Icons.lock_reset_rounded, size: 64, color: AppColors.primary),
              ),
              const SizedBox(height: 32),
              Text("Forgot Password?", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text("Enter your email address and we'll send you instructions to reset your password.", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 48),
              const CustomTextField(
                label: "Email Address",
                hint: "Enter your registered email",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 32),
              MainButton(
                text: "Send Reset Link",
                onPressed: () {
                  Get.snackbar("Success", "Reset link sent to your email", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
