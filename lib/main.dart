import 'package:flutter/material.dart';
import 'package:spaplex/screens/home_screen.dart';
import 'package:spaplex/screens/login.dart';
import 'package:spaplex/screens/profile.dart';
import 'package:spaplex/screens/register.dart';

void main() {
  // AwesomeNotifications().initialize('resource://drawable/logo', [
  //   NotificationChannel(
  //       channelKey: "Basic",
  //       channelName: "Basic Notification",
  //       channelDescription: "This is High Priority",
  //       defaultColor: Colors.amber,
  //       importance: NotificationImportance.Max,
  //       ledColor: Colors.white,
  //       channelShowBadge: true)
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const Register(),
        '/profile': (context) => const ProfileScreen()
      },
    );
  }
}
