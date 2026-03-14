import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Side - Info
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_add_rounded, size: 100, color: Colors.white),
                    const SizedBox(height: 24),
                    Text(
                      "Join Our Medical Network",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Empower your healthcare practice with integrated hospital intelligence.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Right Side - Form
          Expanded(
            flex: 4,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Create Account",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      
                      CustomTextField(
                        label: "Full Name",
                        hint: "Enter your full name",
                        prefixIcon: Icons.person_outline_rounded,
                        controller: controller.nameController,
                        validator: (value) => value == null || value.isEmpty ? "Name is required" : null,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      CustomTextField(
                        label: "Email Address",
                        hint: "Enter your email",
                        prefixIcon: Icons.email_outlined,
                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Email is required";
                          if (!GetUtils.isEmail(value)) return "Enter valid email";
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 20),
                      
                      CustomTextField(
                        label: "Password",
                        hint: "Create a password",
                        isPassword: true,
                        prefixIcon: Icons.lock_outline_rounded,
                        controller: controller.passwordController,
                        validator: (value) => value == null || value.length < 6 ? "Minimum 6 characters" : null,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      CustomTextField(
                        label: "Confirm Password",
                        hint: "Repeat your password",
                        isPassword: true,
                        prefixIcon: Icons.lock_clock_outlined,
                        controller: controller.confirmPasswordController,
                        validator: (value) {
                          if (value != controller.passwordController.text) return "Passwords do not match";
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 40),
                      
                      Obx(() => MainButton(
                        text: "Create My Account",
                        isLoading: controller.isLoading.value,
                        onPressed: () => controller.register(),
                      )),
                      
                      const SizedBox(height: 24),
                      
                      Center(
                        child: TextButton(
                          onPressed: () => Get.back(),
                          child: const Text("Already have an account? Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
