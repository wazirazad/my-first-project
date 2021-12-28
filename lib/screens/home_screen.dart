import 'package:flutter/material.dart';
import 'package:t20_world_cup/screens/history_screen.dart';
import 'package:t20_world_cup/screens/schedule_screen.dart';
import 'package:t20_world_cup/screens/teams_screen.dart';
import 'package:t20_world_cup/screens/venue_screen.dart';
import 'package:t20_world_cup/utility/connetivity_handler.dart';
import 'package:t20_world_cup/widgets/app_drawer.dart';
import 'package:t20_world_cup/widgets/home_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T20 World Cup'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.star,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: [
            //we replace all the children with the help of extract one widget
            HomeItemWidget(
              iconData: Icons.access_time_outlined,
              title: 'Schedule',
              onTap: () {
                Navigator.pushNamed(context, ScheduleScreen.routeName);
              },
            ),
            HomeItemWidget(
              iconData: Icons.location_on_outlined,
              title: 'Venues',
              onTap: () {
                Navigator.pushNamed(context, VenueScreen.routeName);
              },
            ),
            HomeItemWidget(
              iconData: Icons.history,
              title: 'History',
              onTap: () {
                Navigator.pushNamed(context, HistoryScreen.routeName);
              },
            ),
            HomeItemWidget(
              iconData: Icons.group,
              title: 'Teams',
              onTap: () {
                Navigator.pushNamed(context, TeamsScreen.routeName);
              },
            ),
            HomeItemWidget(
              iconData: Icons.live_tv,
              title: 'LiveScore',
              onTap: () async {
                if(await ConnectivityHandler.isConnected()){
                 var _url = 'https://www.t20worldcup.com/';
                 await canLaunch(_url)
                  ? await launch(_url)
                  : print('Could not launch');
                  //here we give the url to go,
                } else {
                  print('not good');
                  return SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      'Please On Wifi Or Data',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }
               },
            ),
            HomeItemWidget(
              iconData: Icons.video_call,
              title: 'HighLights',
              onTap: () {
                print('HighLights');
              },
            ),
          ],
        ),
      ),
    );
  }
}
