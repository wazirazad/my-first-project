import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/venue_model.dart';

class DataHandlerVenue{
  static Future<List<VenueModel>> getAllVenues(BuildContext context) async{
    await Future.delayed(Duration(seconds: 3));
    var venues = <VenueModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    //we load data from here
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var jsonVenues = jsonData['venues'];
    for(var jsonVenue in jsonVenues){
      VenueModel venueModel = VenueModel.fromJSON(jsonVenue);
      venues.add(venueModel);
    }
    return venues;
  }
}