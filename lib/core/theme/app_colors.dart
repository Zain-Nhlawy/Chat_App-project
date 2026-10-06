import 'package:flutter/material.dart';

/// Centralized color tokens for the application.
abstract final class AppColors {
  // Brand Primary (Vibrant electric chat blue inspired by Dribbble)
  static const Color primary = Color(0xFF246BFD);
  static const Color primaryDark = Color(0xFF1A52C7);
  static const Color primaryLight = Color(0xFFE9F0FF);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FE);
  static const Color surfaceLight = Color(0xFFF4F6F9);

  // Text & Content
  static const Color textPrimary = Color(0xFF181A20);
  static const Color textSecondary = Color(0xFF757B8A);
  static const Color textPlaceholder = Color(0xFF9E9E9E);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Borders & Dividers
  static const Color border = Color(0xFFEAEAEA);
  static const Color borderFocused = Color(0xFF246BFD);

  // Status & Feedback
  static const Color error = Color(0xFFFF3B30);
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);
}
