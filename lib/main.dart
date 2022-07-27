// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './app_data.dart';
import './screens/add_guest.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import './screens/pending_screen.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.screenRoute,
        routes: {
          MainScreen.screenRoute: (context) => MainScreen(),
          AddGuest.screenRoute: (context) => AddGuest(),
          PendingScreen.screenRoute: (context) => PendingScreen(),
        });
  }
}
