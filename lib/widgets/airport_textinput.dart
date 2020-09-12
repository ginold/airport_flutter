import 'package:airport_flutter/store/flightSearch/flightSearch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirportTextInput extends StatefulWidget {
  AirportTextInput(
      {Key key, this.direction, this.airport, this.openContainer = false})
      : super(key: key);
  final String direction; // always marked "final".
  final String airport;
  final bool openContainer;

  @override
  _AirportTextInputState createState() => _AirportTextInputState();
}

class _AirportTextInputState extends State<AirportTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.local_airport),
                    Text(widget.direction.toUpperCase()),
                  ],
                ),
              ),
              TextField(
                enabled: !widget.openContainer,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: widget.direction == 'from'
                      ? 'Select departure airport'
                      : 'Select arrival airport',
                ),
                onChanged: (airport) {
                  final flight =
                      Provider.of<FlightSearch>(context, listen: false);

                  if (widget.direction == 'from') {
                    flight.setDepartureAirport(airport);
                  } else {
                    flight.setArrivalAirport(airport);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
