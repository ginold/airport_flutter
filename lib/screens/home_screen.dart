import 'package:airport_flutter/store/flightSearch/flightSearch.dart';
import 'package:airport_flutter/widgets/destination_suggestions_list.dart';
import 'package:airport_flutter/widgets/flight_search_open_container.dart';
import 'package:flutter/material.dart';

import 'destination_map_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title; // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final FlightSearch flightSearch = FlightSearch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DestinationSuggestionsList(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: FlightSearchOpenContainer()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: WhereWeFlyContainer(),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

class WhereWeFlyContainer extends StatelessWidget {
  const WhereWeFlyContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('See our flight map!',
                style: TextStyle(color: Colors.black87, fontSize: 25)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('TAKE ME TO THE MAP',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DestinationMapScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
