import 'package:flutter/material.dart';
import 'package:t20_world_cup/screens/history_screen.dart';
import 'package:t20_world_cup/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:t20_world_cup/screens/schedule_screen.dart';
import 'package:t20_world_cup/screens/teams_screen.dart';
import 'package:t20_world_cup/screens/venue_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.purple,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T20 World Cup',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
      routes: {
        ScheduleScreen.routeName: (ctx) => ScheduleScreen(),
        VenueScreen.routeName: (ctx) => VenueScreen(),
        TeamsScreen.routeName: (ctx) => TeamsScreen(),
        HistoryScreen.routeName: (ctx) => HistoryScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}