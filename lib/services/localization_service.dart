import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  factory LocalizationService() => _instance;
  LocalizationService._internal();

  static const Locale _defaultLocale = Locale('en');
  static const List<Locale> _supportedLocales = [
    Locale('en'),
    Locale('de'),
  ];

  static Locale get defaultLocale => _defaultLocale;
  static List<Locale> get supportedLocales => _supportedLocales;

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Ensake Loyalty',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'login_button': 'Login',
      'invalid_credentials': 'Invalid email or password',
      'login_failed': 'Login failed',
      'rewards': 'Rewards',
      'points': 'Points',
      'available_rewards': 'Available Rewards',
      'claim': 'Claim',
      'claimed': 'Claimed',
      'insufficient_points': 'Insufficient points',
      'reward_claimed_success': 'Reward claimed successfully',
      'claim_failed': 'Failed to claim reward',
      'order_by': 'Order by',
      'distance': 'Distance',
      'points_low_to_high': 'Points (Low to High)',
      'points_high_to_low': 'Points (High to Low)',
      'logout': 'Logout',
      'session_expired': 'Session expired. Please login again.',
      'loading': 'Loading...',
      'error': 'Error',
      'retry': 'Retry',
      'welcome': 'Welcome',
      'login_to_account': 'Login to your Account',
      'enter_email_password': 'Enter your Email Address and Password',
      'email_address': 'Email Address*',
      'password_field': 'Password*',
      'please_enter_email': 'Please enter your email address',
      'please_enter_password': 'Please enter your password',
      'password_min_length': 'Password must be at least 6 characters',
      'forgot_password': 'Forgot Password?',
      'dont_have_account': 'Don\'t have an account? ',
      'register': 'Register',
      'your_points': 'Your Points',
      'available_rewards_count': 'Available Rewards',
      'sort': 'Sort',
      'no_rewards': 'No rewards available',
      'reward_details': 'Reward Details',
      'brand': 'Brand',
      'description': 'Description',
      'points_required': 'Points Required',
      'distance_km': 'km',
      'success': 'Success',
      'failed': 'Failed',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'close': 'Close',
      'back': 'Back',
      'next': 'Next',
      'previous': 'Previous',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'add': 'Add',
      'search': 'Search',
      'filter': 'Filter',
      'clear': 'Clear',
      'done': 'Done',
      'ok': 'OK',
      'yes': 'Yes',
      'no': 'No',
      'profile': 'Profile',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'notifications': 'Notifications',
      'privacy': 'Privacy',
      'terms': 'Terms',
      'help': 'Help',
      'about': 'About',
      'version': 'Version',
      'contact': 'Contact',
      'support': 'Support',
      'feedback': 'Feedback',
      'rate_app': 'Rate App',
      'share_app': 'Share App',
      'logout_confirmation': 'Are you sure you want to logout?',
      'session_timeout': 'Session Timeout',
      'session_timeout_message':
          'Your session has expired. Please login again.',
      'network_error': 'Network Error',
      'network_error_message':
          'Please check your internet connection and try again.',
      'server_error': 'Server Error',
      'server_error_message':
          'Something went wrong on our end. Please try again later.',
      'unknown_error': 'Unknown Error',
      'unknown_error_message':
          'An unexpected error occurred. Please try again.',
    },
    'de': {
      'app_title': 'Ensake Treue',
      'login': 'Anmelden',
      'password': 'Passwort',
      'login_button': 'Anmelden',
      'invalid_credentials': 'Ungültige E-Mail oder Passwort',
      'login_failed': 'Anmeldung fehlgeschlagen',
      'rewards': 'Belohnungen',
      'points': 'Punkte',
      'available_rewards': 'Verfügbare Belohnungen',
      'claim': 'Einlösen',
      'claimed': 'Eingelöst',
      'insufficient_points': 'Nicht genügend Punkte',
      'reward_claimed_success': 'Belohnung erfolgreich eingelöst',
      'claim_failed': 'Belohnung konnte nicht eingelöst werden',
      'order_by': 'Sortieren nach',
      'distance': 'Entfernung',
      'points_low_to_high': 'Punkte (Niedrig zu Hoch)',
      'points_high_to_low': 'Punkte (Hoch zu Niedrig)',
      'logout': 'Abmelden',
      'session_expired': 'Sitzung abgelaufen. Bitte melden Sie sich erneut an.',
      'loading': 'Lädt...',
      'error': 'Fehler',
      'retry': 'Wiederholen',
      'welcome': 'Willkommen',
      'login_to_account': 'In Ihr Konto einloggen',
      'enter_email_password':
          'Geben Sie Ihre E-Mail-Adresse und Ihr Passwort ein',
      'email_address': 'E-Mail-Adresse*',
      'password_field': 'Passwort*',
      'please_enter_email': 'Bitte geben Sie Ihre E-Mail-Adresse ein',
      'please_enter_password': 'Bitte geben Sie Ihr Passwort ein',
      'password_min_length': 'Das Passwort muss mindestens 6 Zeichen lang sein',
      'forgot_password': 'Passwort vergessen?',
      'dont_have_account': 'Haben Sie noch kein Konto? ',
      'register': 'Registrieren',
      'your_points': 'Ihre Punkte',
      'available_rewards_count': 'Verfügbare Belohnungen',
      'sort': 'Sortieren',
      'no_rewards': 'Keine Belohnungen verfügbar',
      'reward_details': 'Belohnungsdetails',
      'brand': 'Marke',
      'description': 'Beschreibung',
      'points_required': 'Benötigte Punkte',
      'distance_km': 'km',
      'success': 'Erfolg',
      'failed': 'Fehlgeschlagen',
      'cancel': 'Abbrechen',
      'confirm': 'Bestätigen',
      'close': 'Schließen',
      'back': 'Zurück',
      'next': 'Weiter',
      'previous': 'Zurück',
      'save': 'Speichern',
      'delete': 'Löschen',
      'edit': 'Bearbeiten',
      'add': 'Hinzufügen',
      'search': 'Suchen',
      'filter': 'Filter',
      'clear': 'Löschen',
      'done': 'Fertig',
      'ok': 'OK',
      'yes': 'Ja',
      'no': 'Nein',
      'profile': 'Profil',
      'settings': 'Einstellungen',
      'language': 'Sprache',
      'theme': 'Design',
      'notifications': 'Benachrichtigungen',
      'privacy': 'Datenschutz',
      'terms': 'Bedingungen',
      'help': 'Hilfe',
      'about': 'Über',
      'version': 'Version',
      'contact': 'Kontakt',
      'support': 'Support',
      'feedback': 'Feedback',
      'rate_app': 'App bewerten',
      'share_app': 'App teilen',
      'logout_confirmation': 'Sind Sie sicher, dass Sie sich abmelden möchten?',
      'session_timeout': 'Sitzungszeitüberschreitung',
      'session_timeout_message':
          'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.',
      'network_error': 'Netzwerkfehler',
      'network_error_message':
          'Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.',
      'server_error': 'Serverfehler',
      'server_error_message':
          'Auf unserer Seite ist etwas schiefgelaufen. Bitte versuchen Sie es später erneut.',
      'unknown_error': 'Unbekannter Fehler',
      'unknown_error_message':
          'Ein unerwarteter Fehler ist aufgetreten. Bitte versuchen Sie es erneut.',
    },
  };

  static String getLocalizedValue(String key, Locale locale) {
    final languageCode = locale.languageCode;
    final values = _localizedValues[languageCode] ?? _localizedValues['en']!;
    return values[key] ?? key;
  }

  static String getLocalizedValueForCurrentLocale(
      String key, BuildContext context) {
    final locale = Localizations.localeOf(context);
    return getLocalizedValue(key, locale);
  }

  // Helper method to get localized string with context
  static String tr(BuildContext context, String key) {
    return getLocalizedValueForCurrentLocale(key, context);
  }
}

// Localizations delegate for Flutter
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return LocalizationService.supportedLocales.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

// AppLocalizations class that implements Flutter's Localizations
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get appTitle =>
      LocalizationService.getLocalizedValue('app_title', locale);
  String get login => LocalizationService.getLocalizedValue('login', locale);
  String get email => LocalizationService.getLocalizedValue('email', locale);
  String get password =>
      LocalizationService.getLocalizedValue('password', locale);
  String get loginButton =>
      LocalizationService.getLocalizedValue('login_button', locale);
  String get invalidCredentials =>
      LocalizationService.getLocalizedValue('invalid_credentials', locale);
  String get loginFailed =>
      LocalizationService.getLocalizedValue('login_failed', locale);
  String get rewards =>
      LocalizationService.getLocalizedValue('rewards', locale);
  String get points => LocalizationService.getLocalizedValue('points', locale);
  String get availableRewards =>
      LocalizationService.getLocalizedValue('available_rewards', locale);
  String get claim => LocalizationService.getLocalizedValue('claim', locale);
  String get claimed =>
      LocalizationService.getLocalizedValue('claimed', locale);
  String get insufficientPoints =>
      LocalizationService.getLocalizedValue('insufficient_points', locale);
  String get rewardClaimedSuccess =>
      LocalizationService.getLocalizedValue('reward_claimed_success', locale);
  String get claimFailed =>
      LocalizationService.getLocalizedValue('claim_failed', locale);
  String get orderBy =>
      LocalizationService.getLocalizedValue('order_by', locale);
  String get distance =>
      LocalizationService.getLocalizedValue('distance', locale);
  String get pointsLowToHigh =>
      LocalizationService.getLocalizedValue('points_low_to_high', locale);
  String get pointsHighToLow =>
      LocalizationService.getLocalizedValue('points_high_to_low', locale);
  String get logout => LocalizationService.getLocalizedValue('logout', locale);
  String get sessionExpired =>
      LocalizationService.getLocalizedValue('session_expired', locale);
  String get loading =>
      LocalizationService.getLocalizedValue('loading', locale);
  String get error => LocalizationService.getLocalizedValue('error', locale);
  String get retry => LocalizationService.getLocalizedValue('retry', locale);
  String get welcome =>
      LocalizationService.getLocalizedValue('welcome', locale);
  String get loginToAccount =>
      LocalizationService.getLocalizedValue('login_to_account', locale);
  String get enterEmailPassword =>
      LocalizationService.getLocalizedValue('enter_email_password', locale);
  String get emailAddress =>
      LocalizationService.getLocalizedValue('email_address', locale);
  String get passwordField =>
      LocalizationService.getLocalizedValue('password_field', locale);
  String get pleaseEnterEmail =>
      LocalizationService.getLocalizedValue('please_enter_email', locale);
  String get pleaseEnterPassword =>
      LocalizationService.getLocalizedValue('please_enter_password', locale);
  String get passwordMinLength =>
      LocalizationService.getLocalizedValue('password_min_length', locale);
  String get forgotPassword =>
      LocalizationService.getLocalizedValue('forgot_password', locale);
  String get dontHaveAccount =>
      LocalizationService.getLocalizedValue('dont_have_account', locale);
  String get register =>
      LocalizationService.getLocalizedValue('register', locale);
  String get yourPoints =>
      LocalizationService.getLocalizedValue('your_points', locale);
  String get availableRewardsCount =>
      LocalizationService.getLocalizedValue('available_rewards_count', locale);
  String get sort => LocalizationService.getLocalizedValue('sort', locale);
  String get noRewards =>
      LocalizationService.getLocalizedValue('no_rewards', locale);
  String get rewardDetails =>
      LocalizationService.getLocalizedValue('reward_details', locale);
  String get brand => LocalizationService.getLocalizedValue('brand', locale);
  String get description =>
      LocalizationService.getLocalizedValue('description', locale);
  String get pointsRequired =>
      LocalizationService.getLocalizedValue('points_required', locale);
  String get distanceKm =>
      LocalizationService.getLocalizedValue('distance_km', locale);
  String get success =>
      LocalizationService.getLocalizedValue('success', locale);
  String get failed => LocalizationService.getLocalizedValue('failed', locale);
  String get cancel => LocalizationService.getLocalizedValue('cancel', locale);
  String get confirm =>
      LocalizationService.getLocalizedValue('confirm', locale);
  String get close => LocalizationService.getLocalizedValue('close', locale);
  String get back => LocalizationService.getLocalizedValue('back', locale);
  String get next => LocalizationService.getLocalizedValue('next', locale);
  String get previous =>
      LocalizationService.getLocalizedValue('previous', locale);
  String get save => LocalizationService.getLocalizedValue('save', locale);
  String get delete => LocalizationService.getLocalizedValue('delete', locale);
  String get edit => LocalizationService.getLocalizedValue('edit', locale);
  String get add => LocalizationService.getLocalizedValue('add', locale);
  String get search => LocalizationService.getLocalizedValue('search', locale);
  String get filter => LocalizationService.getLocalizedValue('filter', locale);
  String get clear => LocalizationService.getLocalizedValue('clear', locale);
  String get done => LocalizationService.getLocalizedValue('done', locale);
  String get ok => LocalizationService.getLocalizedValue('ok', locale);
  String get yes => LocalizationService.getLocalizedValue('yes', locale);
  String get no => LocalizationService.getLocalizedValue('no', locale);
  String get profile =>
      LocalizationService.getLocalizedValue('profile', locale);
  String get settings =>
      LocalizationService.getLocalizedValue('settings', locale);
  String get language =>
      LocalizationService.getLocalizedValue('language', locale);
  String get theme => LocalizationService.getLocalizedValue('theme', locale);
  String get notifications =>
      LocalizationService.getLocalizedValue('notifications', locale);
  String get privacy =>
      LocalizationService.getLocalizedValue('privacy', locale);
  String get terms => LocalizationService.getLocalizedValue('terms', locale);
  String get help => LocalizationService.getLocalizedValue('help', locale);
  String get about => LocalizationService.getLocalizedValue('about', locale);
  String get version =>
      LocalizationService.getLocalizedValue('version', locale);
  String get contact =>
      LocalizationService.getLocalizedValue('contact', locale);
  String get support =>
      LocalizationService.getLocalizedValue('support', locale);
  String get feedback =>
      LocalizationService.getLocalizedValue('feedback', locale);
  String get rateApp =>
      LocalizationService.getLocalizedValue('rate_app', locale);
  String get shareApp =>
      LocalizationService.getLocalizedValue('share_app', locale);
  String get logoutConfirmation =>
      LocalizationService.getLocalizedValue('logout_confirmation', locale);
  String get sessionTimeout =>
      LocalizationService.getLocalizedValue('session_timeout', locale);
  String get sessionTimeoutMessage =>
      LocalizationService.getLocalizedValue('session_timeout_message', locale);
  String get networkError =>
      LocalizationService.getLocalizedValue('network_error', locale);
  String get networkErrorMessage =>
      LocalizationService.getLocalizedValue('network_error_message', locale);
  String get serverError =>
      LocalizationService.getLocalizedValue('server_error', locale);
  String get serverErrorMessage =>
      LocalizationService.getLocalizedValue('server_error_message', locale);
  String get unknownError =>
      LocalizationService.getLocalizedValue('unknown_error', locale);
  String get unknownErrorMessage =>
      LocalizationService.getLocalizedValue('unknown_error_message', locale);
}
