# Ensake Loyalty Rewards App

A Flutter mobile application that implements user authentication and reward management features for a loyalty rewards system.

## Features

### Screen 1: Login
- Email and password input fields with validation
- Login button with loading state
- Proper error handling and user feedback
- Secure token storage with 5-minute session timeout
- Real API integration with test credentials

### Screen 2: Rewards
- **User Information Section:**
  - Display of current user points
  - Count of available rewards
  - Clean card-based UI design

- **Rewards List:**
  - Vertically scrollable list of available rewards
  - Brand name, description, and points required
  - Claim button for each item
  - Client-side validation for sufficient points
  - Success/failure feedback with toast messages

### Optional Features
- **Localization:** English and German language support with locale toggle
- **Reward Ordering:** 
  - By points (ascending/descending)
  - Sort button

## Technical Implementation

### Architecture
- **Provider Pattern:** State management using Provider package
- **Service Layer:** API service for HTTP requests, mock data service for testing
- **Secure Storage:** Flutter Secure Storage for authentication tokens
- **Device Info:** Automatic device header generation for API requests

### Design System
- **Color Scheme:** 
  - Primary: #0066F9 (brand blue)
  - Light Blue: #CAD8FF (accent)
  - White: #FFFFFF (background)
  - Semantic colors for success, warning, error states
- **Typography:** 
  - Custom fonts (Plus Jakarta Sans recommended)
  - Manual font integration for offline reliability
  - Platform-appropriate fallbacks
  - No external font dependencies
  - See `FONT_SETUP.md` for detailed font configuration

### API Integration
- **Real API Endpoints:** Integrated with Ensake staging API
- **Authentication:** POST to `/assessment/login` endpoint
- **Rewards Fetching:** GET to `/assessment/rewards` endpoint
- **Reward Claiming:** POST to `/assessment/rewards` endpoint
- **Headers:** Content-Type, Authorization, and Ensake-Device headers

### State Management
- **AuthProvider:** Manages authentication state, token storage, and session timeout
- **RewardsProvider:** Manages rewards data, ordering, and claiming functionality
- **Automatic Navigation:** Login screen → Rewards screen upon successful authentication

## Getting Started

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK
- Android Studio / Xcode for mobile development
- A physical device or emulator

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd ensake
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### Test Credentials
For testing purposes, use these real API credentials:
- **Email:** ghengiskhan@gmail.com
- **Password:** secret

## Project Structure

```
lib/
├── main.dart                 # App entry point with provider setup
├── models/                   # Data models
│   ├── user.dart            # User model with authentication data
│   └── reward.dart          # Reward model with brand and points info
├── providers/                # State management
│   ├── auth_provider.dart   # Authentication state and session management
│   └── rewards_provider.dart # Rewards data and claiming logic
├── screens/                  # UI screens
│   ├── login_screen.dart    # Login form with validation
│   └── rewards_screen.dart  # Rewards display and claiming
├── services/                 # Business logic and API calls
│   ├── api_service.dart     # HTTP requests to Ensake API
│   ├── mock_data_service.dart # Sample data for testing
│   ├── localization_service.dart # Multi-language support
│   └── font_service.dart    # Typography management with fallbacks
├── utils/                    # Constants and utilities
│   ├── constants.dart        # API endpoints and app constants
│   └── app_colors.dart      # Color scheme and design tokens
```

## API Documentation

The app integrates with the Ensake API at: https://staging-core.ensake.com/assessment-docs

### Endpoints Used
- `POST /assessment/login` - User authentication
- `GET /assessment/rewards` - Fetch available rewards
- `POST /assessment/rewards` - Claim a reward

### Headers
- `Content-Type: application/json`
- `Authorization: Bearer {token}` (for authenticated requests)
- `Ensake-Device: {device-id}/{platform}/{device-name}`

### Real API Data
The app now uses real API data including:
- **User:** Genghis Khan with real profile information
- **Brands:** Circa, Cravvings, Ibom Air, Omenka, Total Energies
- **Rewards:** Real Nigerian brand rewards with actual points and descriptions
- **Points:** 100 points (from real API response)

## Testing

The app includes both real API integration and mock data services:
- **Real API:** Primary data source for production testing
- **Mock Data:** Fallback for offline development and testing
- **Error Handling:** Comprehensive API error handling and user feedback

## Troubleshooting

### Font Setup Issues
The app uses manual font integration for reliability. If you encounter font-related issues:

1. **Check Font Setup:** Follow the detailed guide in `FONT_SETUP.md`
2. **Verify Font Files:** Ensure TTF/OTF files are in `assets/fonts/` directory
3. **Check pubspec.yaml:** Verify fonts section is properly configured
4. **Font Weights:** Ensure font weight values match your font files
5. **Case Sensitivity:** Font file names must match exactly

### Common Issues
1. **Dependencies not found:** Run `flutter pub get`
2. **Build errors:** Ensure Flutter SDK version compatibility
3. **API connection issues:** Check network connectivity and API endpoint availability
4. **Authentication errors:** Verify test credentials or API status
5. **Font not loading:** Run `flutter clean && flutter pub get`

### Debug Mode
Run with debug flags for additional logging:
```bash
flutter run --debug
```

## Customization

### Adding New Languages
1. Add new locale to `LocalizationService.supportedLocales`
2. Add translations to `_localizedValues` map
3. Update locale toggle logic in screens

### Adding New Reward Types
1. Extend the `Reward` model
2. Update mock data in `MockDataService`
3. Modify UI components as needed

### API Configuration
Update constants in `lib/utils/constants.dart`:
- Base URL
- Endpoint paths
- Session timeout duration
- Device header format

### Color Scheme
Modify colors in `lib/utils/app_colors.dart`:
- Primary brand colors
- Semantic colors for different states
- Text and background colors
- Shadow and border colors

## Contributing

1. Follow Flutter coding standards
2. Use meaningful commit messages
3. Test on both Android and iOS platforms
4. Update documentation for new features

## License

This project is part of the Ensake mobile developer assessment.
