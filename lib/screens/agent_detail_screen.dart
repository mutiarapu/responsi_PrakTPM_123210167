import 'package:flutter/material.dart';
import 'package:responsi_123210167/services/api_service.dart';
import 'package:responsi_123210167/models/agent.dart';

class AgentDetailScreen extends StatelessWidget {
  final String uuid;

  AgentDetailScreen({required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agent Detail')),
      body: FutureBuilder<Agent>(
        future: ApiService.fetchAgentDetail(uuid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Agent agent = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(agent.displayIcon),
                  SizedBox(height: 16.0),
                  Text(agent.displayName, style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 8.0),
                  Text(agent.description, style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 16.0),
                  Text('Abilities', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: agent.abilities.length,
                      itemBuilder: (context, index) {
                        var ability = agent.abilities[index];
                        return ListTile(
                          leading: ability.displayIcon.isNotEmpty
                              ? Image.network(ability.displayIcon)
                              : Icon(Icons.adjust),
                          title: Text(ability.displayName),
                          subtitle: Text(ability.description),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
