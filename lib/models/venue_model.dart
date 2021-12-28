import 'package:flutter/material.dart';

class VenueModel {
  String country;
  String city;
  String stadium;
  String image;

  VenueModel({
    @required this.country,
    @required this.city,
    @required this.stadium,
    @required this.image,
  });

  static VenueModel fromJSON(Map<String, dynamic> map) {
    return VenueModel(
        country: map['country'],
        city: map['city'],
        stadium: map['stadium'],
        image: map['image'],
    );
  }
}
