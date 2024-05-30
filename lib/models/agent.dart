import 'ability.dart';

class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final List<Ability> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    var abilitiesJson = json['abilities'] as List;
    List<Ability> abilitiesList = abilitiesJson.map((i) => Ability.fromJson(i)).toList();

    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'] ?? '',
      abilities: abilitiesList,
    );
  }
}
