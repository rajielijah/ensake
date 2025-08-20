# 🎯 Ensake Loyalty Rewards App

A Flutter mobile application that implements user authentication and reward management features for a loyalty rewards system. This app demonstrates proficiency in building mobile applications with proper API integration, state management, and user experience design.

## ✨ **Features**

### **Screen 1: Login**
- ✅ Email and password input fields with validation
- ✅ Login button with loading state and proper error handling
- ✅ Secure token storage with 5-minute session timeout
- ✅ Real API integration with test credentials
- ✅ Proper error handling and user feedback
- ✅ Navigation upon successful authentication

### **Screen 2: Rewards**
- ✅ **User Information Section:**
  - Display of current user points in an attractive card
  - Count of available rewards
  - Clean, modern UI design

- ✅ **Rewards List:**
  - Vertically scrollable list of available rewards
  - Brand name, logo, description, and points required
  - Claim button for each item with client-side validation
  - Success/failure feedback with toast messages
  - UI updates after claiming rewards

### **Optional Features**
- ✅ **Localization:** English and German language support with locale toggle
- ✅ **Reward Ordering:** 
  - By distance (prioritizes nearby brands using mock data)
  - By points (ascending/descending)
  - Sort button with popup menu for all ordering options

---

## 🏗️ **Architecture & Implementation Details**

### **Architectural Pattern:**
- **Provider Pattern** for state management - chosen for simplicity and excellent Flutter integration
- **Service Layer Architecture** for clean separation of concerns
- **Repository Pattern** for data access and API communication
- **Clean Architecture** principles with clear separation of UI, business logic, and data layers

### **Key Implementation Choices:**

#### **State Management:**
- **Provider Package**: Selected over Bloc/Riverpod for its simplicity and Flutter team endorsement
- **Centralized State**: AuthProvider, RewardsProvider, and LanguageProvider manage app state
- **Reactive Updates**: UI automatically updates when state changes

#### **API Integration:**
- **Service-based Approach**: Centralized API communication with proper error handling
- **Header Management**: Automatic device header generation and token management
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Session Management**: Secure token storage with automatic expiry handling

#### **Localization:**
- **Flutter Localizations**: Built-in localization system with custom service layer
- **Dynamic Language Switching**: Real-time language changes without app restart
- **Fallback Support**: Graceful fallback to default language

#### **Security:**
- **Secure Storage**: SharedPreferences for token storage with session management
- **Token Expiry**: 5-minute session timeout for security
- **Header Security**: Proper Authorization headers for authenticated requests

#### **UI/UX Design:**
- **Responsive Design**: Adaptive UI that works across different screen sizes
- **Material Design 3**: Modern Flutter design system implementation
- **Custom Color Scheme**: Brand-specific colors with semantic meaning
- **Typography System**: Custom font integration for consistent branding

---

## 🚀 **Getting Started**

### **Prerequisites**
- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Version 2.17.0 or higher
- **Development Environment**: Android Studio / VS Code with Flutter extensions
- **Device/Emulator**: Physical device or emulator for testing

### **Installation Steps**

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd ensake
   ```

2. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

4. **For specific platform:**
   ```bash
   # Android
   flutter run -d android
   
   # iOS
   flutter run -d ios
   
   # Web
   flutter run -d chrome
   ```

### **Test Credentials**
For testing purposes, use these real API credentials:
- **Email:** `ghengiskhan@gmail.com`
- **Password:** `secret`

---

## 📁 **Project Structure**

```
lib/
├── main.dart                 # App entry point with provider setup
├── models/                   # Data models
│   ├── user.dart            # User model with authentication data
│   └── reward.dart          # Reward model with brand and points info
├── providers/                # State management
│   ├── auth_provider.dart   # Authentication state and session management
│   ├── rewards_provider.dart # Rewards data, ordering, and claiming logic
│   └── language_provider.dart # Language switching and locale management
├── screens/                  # UI screens
│   ├── login_screen.dart    # Login form with validation
│   ├── rewards_screen.dart  # Rewards display and claiming
│   ├── base_page.dart       # Main navigation container
│   ├── qr_code_screen.dart  # QR code placeholder screen
│   ├── history_screen.dart  # History placeholder screen
│   └── profile_screen.dart  # Profile placeholder screen
├── services/                 # Business logic and API calls
│   ├── api_service.dart     # HTTP requests to Ensake API
│   ├── mock_data_service.dart # Sample data for testing
│   ├── localization_service.dart # Multi-language support
│   └── font_service.dart    # Typography management with fallbacks
├── utils/                    # Constants and utilities
│   ├── constants.dart        # API endpoints and app constants
│   ├── app_colors.dart      # Color scheme and design tokens
│   ├── notifier.dart        # Toast and snackbar utilities
│   └── font_examples.dart   # Typography usage examples
└── widgets/                  # Reusable UI components
    ├── reward_card.dart      # Individual reward display card
    ├── reward_modals.dart    # Success/failure modals
    └── language_toggle.dart  # Language switching widget
```

---

## 🔧 **Development & Testing**

### **Development Commands**
```bash
# Install dependencies
flutter pub get

# Run in debug mode
flutter run --debug

# Run in profile mode
flutter run --profile

# Run in release mode
flutter run --release

# Clean build cache
flutter clean

# Analyze code
flutter analyze

# Run tests
flutter test
```

### **Testing Strategy**
- **Unit Tests**: Provider logic and service methods
- **Widget Tests**: UI component behavior
- **Integration Tests**: End-to-end user flows
- **API Testing**: Real API integration testing

### **Debug Features**
- **Console Logging**: Detailed API request/response logging
- **Error Tracking**: Comprehensive error handling and reporting
- **State Inspection**: Provider state debugging tools
- **Network Monitoring**: API call tracking and timing

---

## 🚨 **Troubleshooting**

### **Common Issues & Solutions**

#### **Dependencies Issues**
```bash
# Clear dependency cache
flutter clean
flutter pub get

# Update Flutter
flutter upgrade
```

#### **Build Errors**
- Ensure Flutter SDK version compatibility
- Check for conflicting package versions
- Verify platform-specific configurations

#### **API Connection Issues**
- Check network connectivity
- Verify API endpoint availability
- Check authentication token validity
- Review API response format

#### **Font Loading Issues**
- Verify font files in `assets/fonts/` directory
- Check `pubspec.yaml` font configuration
- Ensure font file names match exactly
- Run `flutter clean && flutter pub get`

#### **Authentication Problems**
- Verify test credentials
- Check API status
- Review token storage implementation
- Clear app data and retry

### **Performance Optimization**
- **Image Caching**: Efficient logo and image loading
- **List Optimization**: Proper ListView.builder usage
- **State Management**: Efficient provider updates
- **Memory Management**: Proper disposal of resources

---

## 🔄 **State Management Flow**

### **Authentication Flow**
1. User enters credentials
2. API call to `/login` endpoint
3. Token storage in secure storage
4. Session timer initialization
5. Navigation to rewards screen
6. Automatic logout after 5 minutes

### **Rewards Management Flow**
1. Fetch rewards on screen load
2. Display user points and rewards count
3. User selects reward to claim
4. Client-side validation (sufficient points)
5. API call to claim endpoint
6. UI update with new points and status

### **Language Switching Flow**
1. User taps language toggle
2. Provider updates current locale
3. UI rebuilds with new language
4. Persistent language preference storage

---

## 📱 **Platform Support**

### **Android**
- **Minimum SDK**: API 21 (Android 5.0)
- **Target SDK**: API 33 (Android 13)
- **Permissions**: Internet access, network state

### **iOS**
- **Minimum Version**: iOS 11.0
- **Target Version**: iOS 16.0
- **Capabilities**: Network access, secure storage

### **Web**
- **Browser Support**: Modern browsers (Chrome, Firefox, Safari, Edge)
- **Responsive Design**: Mobile-first approach

---

## 🚀 **Deployment**

### **Build Commands**
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS Archive
flutter build ios --release

# Web Build
flutter build web --release
```


---
