import 'package:flutter/material.dart';
import 'package:ensake_loyalty_app/services/font_service.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';

/// This file contains examples of how to use the AppFonts service
/// throughout your app for consistent typography.
class FontExamples {
  /// Example of using predefined text styles
  static Widget headlineExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Headline Large', style: AppFonts.headlineLarge),
        Text('Headline Medium', style: AppFonts.headlineMedium),
        Text('Headline Small', style: AppFonts.headlineSmall),
      ],
    );
  }

  /// Example of using title styles
  static Widget titleExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Title Large', style: AppFonts.titleLarge),
        Text('Title Medium', style: AppFonts.titleMedium),
        Text('Title Small', style: AppFonts.titleSmall),
      ],
    );
  }

  /// Example of using body text styles
  static Widget bodyExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Body Large', style: AppFonts.bodyLarge),
        Text('Body Medium', style: AppFonts.bodyMedium),
        Text('Body Small', style: AppFonts.bodySmall),
      ],
    );
  }

  /// Example of using label styles
  static Widget labelExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Label Large', style: AppFonts.labelLarge),
        Text('Label Medium', style: AppFonts.labelMedium),
        Text('Label Small', style: AppFonts.labelSmall),
      ],
    );
  }

  /// Example of using button text styles
  static Widget buttonExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Button Large', style: AppFonts.buttonLarge),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Button Medium', style: AppFonts.buttonMedium),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Button Small', style: AppFonts.buttonSmall),
        ),
      ],
    );
  }

  /// Example of using input field styles
  static Widget inputExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Input Label', style: AppFonts.inputLabel),
        TextField(
          decoration: InputDecoration(
            hintText: 'Input Hint Text',
            hintStyle: AppFonts.inputHint,
          ),
          style: AppFonts.inputText,
        ),
      ],
    );
  }

  /// Example of using custom font weights
  static Widget customWeightExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Extra Light', style: AppFonts.extraLightStyle),
        Text('Light', style: AppFonts.lightStyle),
        Text('Regular', style: AppFonts.regularStyle),
        Text('Medium', style: AppFonts.mediumStyle),
        Text('Semi Bold', style: AppFonts.semiBoldStyle),
        Text('Bold', style: AppFonts.boldStyle),
        Text('Extra Bold', style: AppFonts.extraBoldStyle),
      ],
    );
  }

  /// Example of using italic variants
  static Widget italicExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Regular Italic', style: AppFonts.italicStyle),
        Text('Medium Italic', style: AppFonts.mediumItalicStyle),
        Text('Bold Italic', style: AppFonts.boldItalicStyle),
      ],
    );
  }

  /// Example of combining fonts with colors
  static Widget coloredFontExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Primary Color Text',
          style: AppFonts.headlineMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
        Text(
          'Secondary Color Text',
          style: AppFonts.titleLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          'Success Color Text',
          style: AppFonts.bodyLarge.copyWith(
            color: AppColors.success,
          ),
        ),
      ],
    );
  }

  /// Example of using fonts with custom sizes
  static Widget customSizeExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Size 20',
          style: AppFonts.mediumStyle.copyWith(fontSize: 20),
        ),
        Text(
          'Custom Size 26',
          style: AppFonts.semiBoldStyle.copyWith(fontSize: 26),
        ),
        Text(
          'Custom Size 32',
          style: AppFonts.boldStyle.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  /// Example of using fonts with custom line heights
  static Widget customLineHeightExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Line Height 1.8\nThis text has more spacing between lines',
          style: AppFonts.bodyLarge.copyWith(height: 1.8),
        ),
        Text(
          'Custom Line Height 1.2\nThis text has tighter spacing',
          style: AppFonts.bodyLarge.copyWith(height: 1.2),
        ),
      ],
    );
  }

  /// Example of using fonts in a card
  static Widget cardExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Title',
              style: AppFonts.titleLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This is the card description text that uses the body medium style for readability.',
              style: AppFonts.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Label: ',
                  style: AppFonts.labelMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Value',
                  style: AppFonts.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Usage Examples:
/// 
/// 1. Basic usage:
/// Text('Hello World', style: AppFonts.headlineLarge)
/// 
/// 2. With custom color:
/// Text('Hello World', style: AppFonts.titleMedium.copyWith(color: AppColors.primary))
/// 
/// 3. With custom size:
/// Text('Hello World', style: AppFonts.bodyLarge.copyWith(fontSize: 18))
/// 
/// 4. With custom weight:
/// Text('Hello World', style: AppFonts.regularStyle.copyWith(fontWeight: AppFonts.bold))
/// 
/// 5. In buttons:
/// ElevatedButton(
///   onPressed: () {},
///   child: Text('Click Me', style: AppFonts.buttonMedium),
/// )
/// 
/// 6. In input fields:
/// TextField(
///   style: AppFonts.inputText,
///   decoration: InputDecoration(
///     labelText: 'Email',
///     labelStyle: AppFonts.inputLabel,
///     hintText: 'Enter your email',
///     hintStyle: AppFonts.inputHint,
///   ),
/// )
/// 
/// 7. In lists:
/// ListTile(
///   title: Text('List Item', style: AppFonts.titleSmall),
///   subtitle: Text('Description', style: AppFonts.bodyMedium),
/// )
/// 
/// 8. In dialogs:
/// AlertDialog(
///   title: Text('Dialog Title', style: AppFonts.titleLarge),
///   content: Text('Dialog content', style: AppFonts.bodyLarge),
/// )
