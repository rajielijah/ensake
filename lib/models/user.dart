class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String dialingCode;
  final String countryCode;
  final String token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dialingCode,
    required this.countryCode,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'] as Map<String, dynamic>;
    return User(
      id: customer['id'] ?? '',
      firstName: customer['first_name'] ?? '',
      lastName: customer['last_name'] ?? '',
      email: customer['email'] ?? '',
      phoneNumber: customer['phone_number'] ?? '',
      dialingCode: customer['dialing_code'] ?? '',
      countryCode: customer['country_code'] ?? '',
      token: customer['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer': {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'dialing_code': dialingCode,
        'country_code': countryCode,
        'token': token,
      },
    };
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? dialingCode,
    String? countryCode,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dialingCode: dialingCode ?? this.dialingCode,
      countryCode: countryCode ?? this.countryCode,
      token: token ?? this.token,
    );
  }

  // Helper getters
  String get fullName => '$firstName $lastName';
  String get displayName => firstName.isNotEmpty ? firstName : email;
}
