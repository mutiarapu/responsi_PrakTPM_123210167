import 'package:flutter/material.dart';
import 'package:responsi_123210167/services/api_service.dart';
import 'package:responsi_123210167/models/map.dart';
import 'package:url_launcher/url_launcher.dart';

class MapListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maps')),
      body: FutureBuilder<List<GameMap>>(
        future: ApiService.fetchMaps(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                GameMap map = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    _launchURL(map.splash);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(map.splash, fit: BoxFit.cover),
                        Text(map.displayName),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
