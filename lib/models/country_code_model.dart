class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});

  // Factory method to create a Country object from JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
    );
  }

  // Method to convert Country object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}
