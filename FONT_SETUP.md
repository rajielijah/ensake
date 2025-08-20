# Custom Font Setup - Plus Jakarta Sans

This document explains how to use the custom Plus Jakarta Sans font family throughout the Ensake Loyalty App.

## Font Files

The following font files are included in `assets/fonts/`:

- **PlusJakartaSans-ExtraLight.otf** (Weight: 200)
- **PlusJakartaSans-ExtraLightItalic.otf** (Weight: 200, Style: Italic)
- **PlusJakartaSans-Light.otf** (Weight: 300)
- **PlusJakartaSans-LightItalic.otf** (Weight: 300, Style: Italic)
- **PlusJakartaSans-Regular.otf** (Weight: 400)
- **PlusJakartaSans-Italic.otf** (Weight: 400, Style: Italic)
- **PlusJakartaSans-Medium.otf** (Weight: 500)
- **PlusJakartaSans-MediumItalic.otf** (Weight: 500, Style: Italic)
- **PlusJakartaSans-SemiBold.otf** (Weight: 600)
- **PlusJakartaSans-SemiBoldItalic.otf** (Weight: 600, Style: Italic)
- **PlusJakartaSans-Bold.otf** (Weight: 700)
- **PlusJakartaSans-BoldItalic.otf** (Weight: 700, Style: Italic)
- **PlusJakartaSans-ExtraBold.otf** (Weight: 800)
- **PlusJakartaSans-ExtraBoldItalic.otf** (Weight: 800, Style: Italic)

## Configuration

### 1. pubspec.yaml
The fonts are configured in `pubspec.yaml` under the `fonts` section:

```yaml
fonts:
  - family: PlusJakartaSans
    fonts:
      - asset: assets/fonts/PlusJakartaSans-ExtraLight.otf
        weight: 200
      - asset: assets/fonts/PlusJakartaSans-Light.otf
        weight: 300
      - asset: assets/fonts/PlusJakartaSans-Regular.otf
        weight: 400
      # ... and so on for all weights
```

### 2. App Theme
The font is set as the default font family in `main.dart`:

```dart
theme: ThemeData(
  fontFamily: 'PlusJakartaSans',
  // ... other theme properties
)
```

## Usage

### Import the Font Service
```dart
import 'package:ensake_loyalty_app/services/font_service.dart';
```

### Predefined Text Styles

#### Headlines
```dart
Text('Main Heading', style: AppFonts.headlineLarge)
Text('Section Heading', style: AppFonts.headlineMedium)
Text('Sub Heading', style: AppFonts.headlineSmall)
```

#### Titles
```dart
Text('Page Title', style: AppFonts.titleLarge)
Text('Section Title', style: AppFonts.titleMedium)
Text('Card Title', style: AppFonts.titleSmall)
```

#### Body Text
```dart
Text('Main content text', style: AppFonts.bodyLarge)
Text('Secondary content', style: AppFonts.bodyMedium)
Text('Small text', style: AppFonts.bodySmall)
```

#### Labels
```dart
Text('Form Label', style: AppFonts.labelLarge)
Text('Small Label', style: AppFonts.labelMedium)
Text('Tiny Label', style: AppFonts.labelSmall)
```

#### Buttons
```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Large Button', style: AppFonts.buttonLarge),
)

ElevatedButton(
  onPressed: () {},
  child: Text('Medium Button', style: AppFonts.buttonMedium),
)

ElevatedButton(
  onPressed: () {},
  child: Text('Small Button', style: AppFonts.buttonSmall),
)
```

#### Input Fields
```dart
TextField(
  style: AppFonts.inputText,
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: AppFonts.inputLabel,
    hintText: 'Enter your email',
    hintStyle: AppFonts.inputHint,
  ),
)
```

### Custom Font Weights

#### Basic Weights
```dart
Text('Extra Light', style: AppFonts.extraLightStyle)
Text('Light', style: AppFonts.lightStyle)
Text('Regular', style: AppFonts.regularStyle)
Text('Medium', style: AppFonts.mediumStyle)
Text('Semi Bold', style: AppFonts.semiBoldStyle)
Text('Bold', style: AppFonts.boldStyle)
Text('Extra Bold', style: AppFonts.extraBoldStyle)
```

#### Italic Variants
```dart
Text('Italic Text', style: AppFonts.italicStyle)
Text('Medium Italic', style: AppFonts.mediumItalicStyle)
Text('Bold Italic', style: AppFonts.boldItalicStyle)
```

### Combining Styles

#### With Custom Colors
```dart
Text(
  'Colored Text',
  style: AppFonts.headlineMedium.copyWith(
    color: AppColors.primary,
  ),
)
```

#### With Custom Sizes
```dart
Text(
  'Custom Size',
  style: AppFonts.bodyLarge.copyWith(fontSize: 18),
)
```

#### With Custom Line Heights
```dart
Text(
  'Custom Line Height',
  style: AppFonts.bodyLarge.copyWith(height: 1.8),
)
```

#### With Custom Weights
```dart
Text(
  'Custom Weight',
  style: AppFonts.regularStyle.copyWith(
    fontWeight: AppFonts.bold,
  ),
)
```

## Best Practices

### 1. Consistency
- Use predefined styles (`AppFonts.headlineLarge`, `AppFonts.bodyMedium`, etc.) for consistent typography
- Avoid hardcoding font weights and sizes

### 2. Hierarchy
- Use `headlineLarge` for main page titles
- Use `titleMedium` for section headers
- Use `bodyLarge` for main content
- Use `labelMedium` for form labels

### 3. Readability
- Use `bodyLarge` (16px) for main text content
- Use `bodyMedium` (14px) for secondary content
- Use `bodySmall` (12px) sparingly for captions

### 4. Buttons
- Use `buttonLarge` for primary actions
- Use `buttonMedium` for secondary actions
- Use `buttonSmall` for tertiary actions

### 5. Input Fields
- Use `inputLabel` for field labels
- Use `inputText` for input content
- Use `inputHint` for placeholder text

## Examples

### Card Layout
```dart
Card(
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
          'Card description text',
          style: AppFonts.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    ),
  ),
)
```

### List Item
```dart
ListTile(
  title: Text('List Item', style: AppFonts.titleSmall),
  subtitle: Text('Description', style: AppFonts.bodyMedium),
  trailing: Text('Value', style: AppFonts.labelMedium),
)
```

### Dialog
```dart
AlertDialog(
  title: Text('Dialog Title', style: AppFonts.titleLarge),
  content: Text('Dialog content', style: AppFonts.bodyLarge),
  actions: [
    TextButton(
      onPressed: () {},
      child: Text('Cancel', style: AppFonts.buttonMedium),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Confirm', style: AppFonts.buttonMedium),
    ),
  ],
)
```

## Troubleshooting

### Font Not Loading
1. Ensure `flutter pub get` has been run
2. Check that font files are in the correct `assets/fonts/` directory
3. Verify font family name matches exactly in `pubspec.yaml`
4. Clean and rebuild the project: `flutter clean && flutter pub get`

### Font Weight Not Working
1. Ensure the specific weight is included in `pubspec.yaml`
2. Check that the font file name matches the weight specification
3. Use `AppFonts.boldStyle` instead of `FontWeight.bold`

### Performance
- The fonts are loaded once when the app starts
- No performance impact during runtime
- All font variants are available immediately

## Migration from Default Fonts

To replace existing `TextStyle` usage:

### Before
```dart
Text(
  'Hello World',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
)
```

### After
```dart
Text(
  'Hello World',
  style: AppFonts.headlineSmall,
)
```

### Before
```dart
Text(
  'Button Text',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
)
```

### After
```dart
Text(
  'Button Text',
  style: AppFonts.buttonLarge,
)
```

This setup provides a consistent, professional typography system throughout your app using the Plus Jakarta Sans font family.

