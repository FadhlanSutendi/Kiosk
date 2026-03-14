import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0D47A1); // Deep Blue - Clinical/Professional
  static const Color accent = Color(0xFF29B6F6);  // Light Blue
  static const Color background = Color(0xFFF5F7FB);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  
  static const Color textPrimary = Color(0xFF1A1C1E);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color border = Color(0xFFE0E0E0);

  // High-end medical gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
