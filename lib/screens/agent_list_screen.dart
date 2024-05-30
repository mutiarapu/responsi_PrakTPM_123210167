import 'package:flutter/material.dart';
import 'package:responsi_123210167/services/api_service.dart';
import 'package:responsi_123210167/models/agent.dart';
import 'agent_detail_screen.dart';

class AgentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agents')),
      body: FutureBuilder<List<Agent>>(
        future: ApiService.fetchAgents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Agent agent = snapshot.data![index];
                return ListTile(
                  leading: Image.network(agent.displayIcon),
                  title: Text(agent.displayName),
                  subtitle: Text(agent.description),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AgentDetailScreen(uuid: agent.uuid),
                    ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
