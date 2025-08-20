import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ensake_loyalty_app/providers/auth_provider.dart';
import 'package:ensake_loyalty_app/providers/rewards_provider.dart';
import 'package:ensake_loyalty_app/screens/login_screen.dart';
import 'package:ensake_loyalty_app/screens/base_page.dart';
import 'package:ensake_loyalty_app/services/localization_service.dart';
import 'package:ensake_loyalty_app/providers/language_provider.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';

void main() {
  runApp(const EnsakeLoyaltyApp());
}

class EnsakeLoyaltyApp extends StatelessWidget {
  const EnsakeLoyaltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RewardsProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) => MaterialApp(
          title: 'Ensake Loyalty',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: AppColors.primary,
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background,
            fontFamily: 'PlusJakartaSans',
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
              displayMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
              displaySmall: TextStyle(fontFamily: 'PlusJakartaSans'),
              headlineLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
              headlineMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
              headlineSmall: TextStyle(fontFamily: 'PlusJakartaSans'),
              titleLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
              titleMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
              titleSmall: TextStyle(fontFamily: 'PlusJakartaSans'),
              bodyLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
              bodyMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
              bodySmall: TextStyle(fontFamily: 'PlusJakartaSans'),
              labelLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
              labelMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
              labelSmall: TextStyle(fontFamily: 'PlusJakartaSans'),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 2,
                shadowColor: AppColors.shadow,
              ),
            ),
          ),
          locale: languageProvider.currentLocale,
          debugShowCheckedModeBanner: false,
          supportedLocales: LocalizationService.supportedLocales,
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, _) {
              if (authProvider.isAuthenticated) {
                return const BasePage();
              }
              return const LoginScreen();
            },
          ),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/base': (context) => const BasePage(),
          },
        ),
      ),
    );
  }
}
