import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors (Modern Purple/Blue Theme)
  static const Color primary = Color(0xFF2196F3); // Indigo-500
  static const Color primaryDark = Color(0xFF4F46E5); // Indigo-600
  static const Color primaryLight = Color(0xFF818CF8); // Indigo-400
  
  // Secondary Colors
  static const Color secondary = Color(0xFF03A9F4); // Purple-500
  static const Color accent = Color(0xFF00BCD4); // Cyan-500
  static const Color accentPink = Color(0xFFEC4899); // Pink-500
  
  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // Slate-50
  static const Color surface = Color(0xFFF5F5F5);
  static const Color surfaceVariant = Color(0xFFF1F5F9); // Slate-100
  static const Color surfaceDim = Color(0xFFE2E8F0); // Slate-200
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Slate-900
  static const Color textSecondary = Color(0xFF757575); // Slate-600
  static const Color textTertiary = Color(0xFF9E9E9E); // Slate-400
  static const Color textDisabled = Color(0xFFCBD5E1); // Slate-300
  
  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald-500
  static const Color warning = Color(0xFFF59E0B); // Amber-500
  static const Color error = Color(0xFFEF4444); // Red-500
  static const Color info = Color(0xFF3B82F6); // Blue-500
  
  // Border Colors
  static const Color border = Color(0xFFE0E0E0); // Slate-200
  static const Color borderLight = Color(0xFFF1F5F9); // Slate-100
  static const Color borderFocus = primary;
  
  // Additional UI Colors
  static const Color shadow = Color(0x1A000000); // 10% black
  static const Color overlay = Color(0x66000000); // 40% black
  static const Color favorite = Color(0xFFEF4444); // Red-500 for heart icon
  
  // Gradient Colors
  static const List<Color> primaryGradient = [primary, secondary];
  static const List<Color> accentGradient = [accent, accentPink];
  static const List<Color> successGradient = [success, accent];
}