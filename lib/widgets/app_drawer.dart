import 'package:flutter/material.dart';
import 'package:t20_world_cup/screens/history_screen.dart';
import 'package:t20_world_cup/screens/schedule_screen.dart';
import 'package:t20_world_cup/screens/teams_screen.dart';
import 'package:t20_world_cup/screens/venue_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.grey),
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.highlight,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    'T20 World cup',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              title: Text(
                'Schedule',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(ScheduleScreen.routeName,);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Venues',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(VenueScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.white,
              ),
              title: Text(
                'History',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(HistoryScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Colors.white,
              ),
              title: Text(
                'Teams',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(TeamsScreen.routeName);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 1.9,
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.white,
              ),
              title: Text(
                'Rate App',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
