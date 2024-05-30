class GameMap {
  final String uuid;
  final String displayName;
  final String splash;

  GameMap({required this.uuid, required this.displayName, required this.splash});

  factory GameMap.fromJson(Map<String, dynamic> json) {
    return GameMap(
      uuid: json['uuid'],
      displayName: json['displayName'],
      splash: json['splash'] ?? '',
    );
  }
}
