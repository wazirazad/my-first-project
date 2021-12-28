import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/team_model.dart';
import 'package:t20_world_cup/utility/data_handler_team.dart';

class TeamsScreen extends StatelessWidget {
  static const routeName = 'teams-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<TeamModel>>(
          future: DataHandlerTeam.getAllTeams(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<TeamModel> teams = snapshot.data;
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  TeamModel team = teams[index];
                  return Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            team.flag,
                            height: 70,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          team.fullName,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
