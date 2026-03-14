import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/bindings/initial_binding.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/forgot_password_page.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'MediFlow Pro - Hospital Management',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialBinding: InitialBinding(),
          initialRoute: '/login',
          getPages: [
            GetPage(name: '/login', page: () => const LoginPage()),
            GetPage(name: '/register', page: () => const RegisterPage()),
            GetPage(name: '/forgot-password', page: () => const ForgotPasswordPage()),
            GetPage(name: '/home', page: () => const HomePage()),
          ],
        );
      },
    );
  }
}
