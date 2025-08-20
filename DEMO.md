# Ensake Loyalty App Demo Guide

## Quick Start

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

## Demo Flow

### 1. Login Screen
- **Demo Credentials:**
  - Email: `demo@ensake.com`
  - Password: `password123`
- **Features to test:**
  - Email validation (try invalid email format)
  - Password validation (try short password)
  - Language toggle (EN/DE button in app bar)
  - Login button loading state

### 2. Rewards Screen
- **User Information:**
  - Points display (1500 points)
  - Available rewards count (8 rewards)
- **Rewards List:**
  - Scroll through 8 different brand rewards
  - Each reward shows brand, description, points required, and distance
  - Claim buttons for rewards you can afford
- **Features to test:**
  - Sort button (top-right app bar) - try different ordering options:
    - Distance (nearby brands first)
    - Points Low to High
    - Points High to Low
  - Language toggle (EN/DE button)
  - Claim rewards (try claiming different ones)
  - Logout button (top-right app bar)

### 3. Reward Ordering Demo
The app includes mock distance data for demonstration:
- **Closest:** Domino's (0.3 km)
- **Farthest:** Taco Bell (2.5 km)
- **Point ranges:** 500 (Starbucks) to 1500 (Domino's)

### 4. Localization Demo
- **English:** Default language with professional UI text
- **German:** Full translation of all user-facing text
- **Toggle:** Tap the language code button (EN/DE) in the app bar

## Mock Data

The app includes realistic sample data:
- **User:** Demo User with 1500 points
- **Brands:** Starbucks, McDonald's, Subway, KFC, Pizza Hut, Burger King, Domino's, Taco Bell
- **Rewards:** Free coffee, meals, pizzas, etc.
- **Points:** Range from 500 to 1500 points

## Session Management

- **Auto-logout:** After 5 minutes of inactivity
- **Secure storage:** Auth token stored securely
- **State persistence:** App remembers login state between sessions

## Error Handling

- **Network errors:** Try with airplane mode
- **Validation errors:** Try invalid login credentials
- **Insufficient points:** Try claiming expensive rewards
- **Toast messages:** Success/error feedback for all actions

## Testing Scenarios

1. **Happy Path:**
   - Login with demo credentials
   - Browse rewards
   - Claim a reward
   - Change language
   - Sort rewards

2. **Edge Cases:**
   - Try claiming rewards you can't afford
   - Test with different sorting options
   - Switch languages multiple times
   - Let session expire

3. **UI/UX:**
   - Test on different screen sizes
   - Verify responsive design
   - Check accessibility features
   - Test smooth scrolling

## Troubleshooting

- **App won't start:** Run `flutter doctor` to check setup
- **Dependencies missing:** Run `flutter pub get`
- **Build errors:** Check Flutter version compatibility
- **Performance issues:** Run in release mode for better performance

## Next Steps

The app is ready for:
- API integration with real Ensake endpoints
- Additional reward types and categories
- User profile management
- Push notifications
- Analytics and tracking
- Advanced filtering and search
