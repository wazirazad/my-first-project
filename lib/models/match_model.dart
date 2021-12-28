import 'package:flutter/foundation.dart';

class MatchModel {
  String date;
  String teamOne;
  String teamTwo;
  String flagOne;
  String flagTwo;
  String group;
  String venue;
  String time;

  MatchModel({
    @required this.date,
    @required this.teamOne,
    @required this.teamTwo,
    @required this.flagOne,
    @required this.flagTwo,
    @required this.group,
    @required this.venue,
    @required this.time,
  });

  //we create function which we send map and return object,
  static MatchModel fromJSON(Map<String, dynamic> map) {
    return MatchModel(
        date: map['date'],
        teamOne: map['teamOne'],
        teamTwo: map['teamTwo'],
        flagOne: map['flagOne'],
        flagTwo: map['flagTwo'],
        group: map['group'],
        venue: map['venue'],
        time: map['time'],
    );
  }
}
