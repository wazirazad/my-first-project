import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/match_model.dart';
import 'package:t20_world_cup/utility/data_handler.dart';

class ScheduleScreen extends StatelessWidget {
  static const routeName = 'schedule-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<MatchModel>>(
          future: DataHandler.getAllMatches(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<MatchModel> matches = snapshot.data;
              return ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    MatchModel match = matches[index];
                    //also use container
                    return Container(
                      height: 185,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.purple,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            match.date,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/flags/${match.flagOne}',
                                      width: 80,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    match.teamOne,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                              Text(
                                'vs',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    match.teamTwo,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/flags/${match.flagTwo}',
                                      width: 80,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            match.venue,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Group ${match.group}',
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                    // return Card(
                    //   color: Colors.purple,
                    //   //elevation: 10,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16),
                    //     ),
                    //     child: Container(
                    //       margin: EdgeInsets.only(bottom: 10),
                    //       height: 180,
                    //       child: Column(
                    //         children: [
                    //           Text('Hell'),
                    //         ],
                    //       ),
                    //     ),
                    // );
                  });
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
