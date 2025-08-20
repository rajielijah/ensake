import 'package:flutter/material.dart';

class AppFonts {
  // Font Family
  static const String _fontFamily = 'PlusJakartaSans';

  // Font Weights
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Text Styles
  static TextStyle get extraLightStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraLight,
      );

  static TextStyle get lightStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: light,
      );

  static TextStyle get regularStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
      );

  static TextStyle get mediumStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
      );

  static TextStyle get semiBoldStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
      );

  static TextStyle get boldStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
      );

  static TextStyle get extraBoldStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraBold,
      );

  // Italic Variants
  static TextStyle get extraLightItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraLight,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get lightItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: light,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get italicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get mediumItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get semiBoldItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get boldItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get extraBoldItalicStyle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraBold,
        fontStyle: FontStyle.italic,
      );

  // Predefined Text Styles for Common Use Cases
  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 32,
        height: 1.2,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 28,
        height: 1.2,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 24,
        height: 1.2,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 22,
        height: 1.3,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 18,
        height: 1.3,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 16,
        height: 1.3,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.5,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 14,
        height: 1.5,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 12,
        height: 1.5,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 14,
        height: 1.3,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 12,
        height: 1.3,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 10,
        height: 1.3,
      );

  // Button Text Styles
  static TextStyle get buttonLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 16,
        height: 1.2,
      );

  static TextStyle get buttonMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 14,
        height: 1.2,
      );

  static TextStyle get buttonSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 12,
        height: 1.2,
      );

  // Input Field Text Styles
  static TextStyle get inputText => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.4,
      );

  static TextStyle get inputLabel => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 14,
        height: 1.3,
      );

  static TextStyle get inputHint => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.4,
      );
}
