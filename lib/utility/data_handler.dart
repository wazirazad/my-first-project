import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/match_model.dart';

class DataHandler {
  //in this we data from json and make list and we send to ui,
  //it's some time so as future
  static Future<List<MatchModel>> getAllMatches(BuildContext context) async{
    //jaanboch kar delay karna
    await Future.delayed(Duration(seconds: 4));
    var matches = <MatchModel>[];
    //we read data from json with this,
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    //the above data in string so we convert into json
    var jsonData = json.decode(data);
    var jsonSchedule = jsonData['schedule'];//we access schedule from json
    //we take data in loop
    for(var jsonMatch in jsonSchedule){
      MatchModel matchModel = MatchModel.fromJSON(jsonMatch);//we pass jsonMatch to this function
      //now we that
      matches.add(matchModel);
    }
    return matches;
  }
}