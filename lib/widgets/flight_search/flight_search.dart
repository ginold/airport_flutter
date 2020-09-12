import 'package:airport_flutter/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:airport_flutter/widgets/airport_textinput.dart';

class FlightSearchInput extends StatelessWidget {
  const FlightSearchInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Find a flight',
              style: TextStyle(color: Colors.black87, fontSize: 25)),
          AirportTextInput(direction: 'from'),
          AirportTextInput(direction: 'to'),
          Calendar()
        ],
      ),
    );
  }
}
