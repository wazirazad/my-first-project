
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_world_cup/models/team_model.dart';

class DataHandlerTeam{
  static Future<List<TeamModel>> getAllTeams(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));
    var teams = <TeamModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var jsonTeams = jsonData['teams'];
    for(var jsonTeam in jsonTeams){
      TeamModel teamModel = TeamModel.fromJSON(jsonTeam);
      teams.add(teamModel);
    }
    return teams;
  }
}