class Brand {
  final int id;
  final String name;
  final String logo;
  final String address;

  Brand({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'address': address,
    };
  }

  Brand copyWith({
    int? id,
    String? name,
    String? logo,
    String? address,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      address: address ?? this.address,
    );
  }
}

class Reward {
  final int id;
  final Brand brand;
  final int points;
  final String description;
  final bool claimed;

  Reward({
    required this.id,
    required this.brand,
    required this.points,
    required this.description,
    required this.claimed,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'] ?? 0,
      brand: Brand.fromJson(json['brand'] ?? {}),
      points: json['points'] ?? 0,
      description: json['description'] ?? '',
      claimed: json['claimed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand.toJson(),
      'points': points,
      'description': description,
      'claimed': claimed,
    };
  }

  Reward copyWith({
    int? id,
    Brand? brand,
    int? points,
    String? description,
    bool? claimed,
  }) {
    return Reward(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      points: points ?? this.points,
      description: description ?? this.description,
      claimed: claimed ?? this.claimed,
    );
  }

  // Helper getters for backward compatibility
  String get brandName => brand.name;
  String get logo => brand.logo;
  int get pointsRequired => points;
  bool get isClaimed => claimed;
}
