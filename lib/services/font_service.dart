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
  static TextStyle get extraLightStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraLight,
      );

  static TextStyle get lightStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: light,
      );

  static TextStyle get regularStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
      );

  static TextStyle get mediumStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
      );

  static TextStyle get semiBoldStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
      );

  static TextStyle get boldStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
      );

  static TextStyle get extraBoldStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraBold,
      );

  // Italic Variants
  static TextStyle get extraLightItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraLight,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get lightItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: light,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get italicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get mediumItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get semiBoldItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get boldItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get extraBoldItalicStyle => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: extraBold,
        fontStyle: FontStyle.italic,
      );

  // Predefined Text Styles for Common Use Cases
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 32,
        height: 1.2,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 28,
        height: 1.2,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: bold,
        fontSize: 24,
        height: 1.2,
      );

  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 22,
        height: 1.3,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 18,
        height: 1.3,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 16,
        height: 1.3,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.5,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 14,
        height: 1.5,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 12,
        height: 1.5,
      );

  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 14,
        height: 1.3,
      );

  static TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 12,
        height: 1.3,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: medium,
        fontSize: 10,
        height: 1.3,
      );

  // Button Text Styles
  static TextStyle get buttonLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 16,
        height: 1.2,
      );

  static TextStyle get buttonMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 14,
        height: 1.2,
      );

  static TextStyle get buttonSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 12,
        height: 1.2,
      );

  // Input Field Text Styles
  static TextStyle get inputText => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.4,
      );

  static TextStyle get inputLabel => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: semiBold,
        fontSize: 14,
        height: 1.3,
      );

  static TextStyle get inputHint => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: regular,
        fontSize: 16,
        height: 1.4,
      );
}
