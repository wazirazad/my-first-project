import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/history_model.dart';

class DataHandlerHistory{
  static Future<List<HistoryModel>> getAllHistory(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));
    var histories = <HistoryModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var jsonHistory = jsonData['history'];
    for(var history in jsonHistory){
      HistoryModel historyModel = HistoryModel.fromJSON(history);
      histories.add(historyModel);
    }
    return histories;
  }
}