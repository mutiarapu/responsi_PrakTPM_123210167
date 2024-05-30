import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi_123210167/models/agent.dart';
import 'package:responsi_123210167/models/map.dart';

class ApiService {
  static const String baseUrl = 'https://valorant-api.com/v1';

  static Future<List<Agent>> fetchAgents() async {
    final response = await http.get(Uri.parse('$baseUrl/agents'));
    if (response.statusCode == 200) {
      List agents = json.decode(response.body)['data'];
      return agents.map((agent) => Agent.fromJson(agent)).toList();
    } else {
      throw Exception('Failed to load agents');
    }
  }

  static Future<List<GameMap>> fetchMaps() async {
    final response = await http.get(Uri.parse('$baseUrl/maps'));
    if (response.statusCode == 200) {
      List maps = json.decode(response.body)['data'];
      return maps.map((map) => GameMap.fromJson(map)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }

  static Future<Agent> fetchAgentDetail(String uuid) async {
    final response = await http.get(Uri.parse('$baseUrl/agents/$uuid'));
    if (response.statusCode == 200) {
      return Agent.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load agent details');
    }
  }
}
