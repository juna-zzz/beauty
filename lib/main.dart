import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spaplex/screens/bottomnav.dart';
import 'package:spaplex/screens/login.dart';
import 'package:spaplex/screens/map.dart';
import 'package:spaplex/screens/product_info.dart';
import 'package:spaplex/screens/profile.dart';
import 'package:spaplex/screens/register.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'model/favourite.dart';

void main() async {
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(FavouriteMAdapter());
  await Hive.openBox('favourite');
  AwesomeNotifications().initialize('resource://drawable/logo', [
    NotificationChannel(
        channelKey: "Basic",
        channelName: "Basic Notification",
        channelDescription: "This is High Priority",
        defaultColor: Colors.amber,
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Mainscreen(),
        '/register': (context) => const Register(),
        '/profile': (context) => const ProfileScreen(),
        '/map': (context) => const MapZone(),
        '/productinfo': (context) => const ProductInfo()
      },
    );
  }
}
