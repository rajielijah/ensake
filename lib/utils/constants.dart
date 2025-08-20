class AppConstants {
  static const String baseUrl = 'https://staging-core.ensake.com/assessment';

  static const String loginEndpoint = '/login';
  static const String rewardsEndpoint = '/rewards';
  static const String claimRewardEndpoint = '/rewards';

  static const String contentTypeHeader = 'Content-Type';
  static const String contentTypeValue = 'application/json';
  static const String authorizationHeader = 'Authorization';
  static const String ensakeDeviceHeader = 'Ensake-Device';

  static const String authTokenKey = 'auth_token';
  static const int sessionTimeoutMinutes = 5;

  static const String englishLocale = 'en';
  static const String germanLocale = 'de';

  static const String testEmail = 'ghengiskhan@gmail.com';
  static const String testPassword = 'secret';

  static const Map<String, double> brandDistances = {
    'Circa': 0.5,
    'Cravvings': 1.2,
    'Ibom Air': 2.1,
    'Omenka': 0.8,
    'Total Energies': 1.5,
  };
}
