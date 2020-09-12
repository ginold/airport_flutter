import 'package:airport_flutter/screens/flight_search_results_screen.dart';
import 'package:airport_flutter/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:airport_flutter/widgets/airport_textinput.dart';

class FlightSearchScreen extends StatelessWidget {
  FlightSearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Find a flight',
                    style: TextStyle(color: Colors.black87, fontSize: 25)),
                AirportTextInput(direction: 'from'),
                AirportTextInput(direction: 'to'),
                Calendar(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor.withOpacity(.8),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FlightSearchResultsScreen()));
                          // SlideFromRight(
                          //     exitPage: HomeScreen(),
                          //     enterPage: SearchFlightsScreen()));
                        },
                        child: Text(
                          "Travel!".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
