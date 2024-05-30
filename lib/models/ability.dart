class Ability {
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({required this.displayName, required this.description, required this.displayIcon});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      displayName: json['displayName'] ?? 'Unknown',
      description: json['description'] ?? 'No description',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
