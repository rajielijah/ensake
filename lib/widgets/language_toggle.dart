import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ensake_loyalty_app/providers/language_provider.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return PopupMenuButton<String>(
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                languageProvider.currentLanguageCode.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.language,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
          onSelected: (String languageCode) {
            languageProvider.changeLanguage(languageCode);
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'en',
              child: Row(
                children: [
                  const Text('🇺🇸'),
                  const SizedBox(width: 8),
                  Text(
                    'English',
                    style: TextStyle(
                      fontWeight: languageProvider.currentLanguageCode == 'en'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'de',
              child: Row(
                children: [
                  const Text('🇩🇪'),
                  const SizedBox(width: 8),
                  Text(
                    'Deutsch',
                    style: TextStyle(
                      fontWeight: languageProvider.currentLanguageCode == 'de'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
