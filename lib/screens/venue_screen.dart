import 'package:flutter/material.dart';
import 'package:t20_world_cup/models/venue_model.dart';
import 'package:t20_world_cup/utility/data_handler_venue.dart';

class VenueScreen extends StatelessWidget {
  static const routeName = 'venue-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Venues'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<VenueModel>>(
            future: DataHandlerVenue.getAllVenues(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<VenueModel> venues = snapshot.data;
                return ListView.builder(
                  itemCount: venues.length,
                  itemBuilder: (context, index) {
                    VenueModel venue = venues[index];
                    return Container(
                      height: 280,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Country: ${venue.country}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'City: ${venue.city}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            venue.stadium,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              venue.image,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
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
        ));
  }
}
