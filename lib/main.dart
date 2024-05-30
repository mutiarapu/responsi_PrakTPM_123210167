import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900], // Biru tua
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue[300], // Biru muda
        ),
        scaffoldBackgroundColor: Colors.blue[50],
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.blue[900]),
          headline6: TextStyle(color: Colors.blue[900]),
          bodyText2: TextStyle(color: Colors.blue[800]),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[900],
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
          ),
        ),
      ),
      home: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data! ? HomeScreen() : LoginScreen();
          }
        },
      ),
    );
  }
}
