import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF5D7B6F); // Sage Green
  static const Color secondaryColor = Color(0xFFA9C2A6); // Soft Moss
  static const Color accentColor = Color(0xFFF4EAD5); // Cream/Bone
  static const Color backgroundColor = Color(0xFFFDFAF5); // Off-white
  static const Color errorColor = Color(0xFFD32F2F);
  
  static const Color textPrimary = Color(0xFF2D312E);
  static const Color textSecondary = Color(0xFF6B7280);

  // Splash Screen Luxury Colors
  static const Color splashPrimary = Color(0xFF675D53);
  static const Color splashOnSurfaceVariant = Color(0xFF4D453F);
  static const Color splashGradientStart = Color(0xFFFAF9F6);
  static const Color splashGradientEnd = Color(0xFFFCE7E7);
  static const Color splashAmbient1 = Color(0xFFF5E6DA);
  static const Color splashAmbient2 = Color(0xFFFDD4C0);
  static const Color splashError = Color(0xFFBA1A1A);
  static const Color splashErrorContainer = Color(0xFFFFDAD6);
  static const Color splashOutlineVariant = Color(0xFFD0C4BC);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: backgroundColor,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: textPrimary,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
        ),
        headlineMedium: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
