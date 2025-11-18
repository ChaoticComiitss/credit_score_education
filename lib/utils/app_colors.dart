import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Figma Color Palette
  static const Color primary = Color(0xFF3B82F6); // Blue
  static const Color accent = Color(0xFFFBBF24);  // Yellow
  static const Color success = Color(0xFF22C55E); // Green
  static const Color darkBg = Color(0xFF0F172A);  // Dark mode background

  // Additional colors
  static const Color warning = Color(0xFFEF4444);  // Red for warnings
  static const Color textPrimary = Color(0xFF1F2937); // Dark text
  static const Color textSecondary = Color(0xFF6B7280); // Light text

  // Material Color for primary swatch
  static MaterialColor primarySwatch = MaterialColor(primary.value, {
    50: Color(0xFFEFF6FF),
    100: Color(0xFFDBEAFE),
    200: Color(0xFFBFDBFE),
    300: Color(0xFF93C5FD),
    400: Color(0xFF60A5FA),
    500: primary,
    600: Color(0xFF2563EB),
    700: Color(0xFF1D4ED8),
    800: Color(0xFF1E40AF),
    900: Color(0xFF1E3A8A),
  });
}