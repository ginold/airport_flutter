import 'package:airport_flutter/screens/book_flight_screen.dart';
import 'package:airport_flutter/store/flightSearch/flightSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FlightSearchResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flightSearch = Provider.of<FlightSearch>(context, listen: false);
    DateFormat dateFormat = DateFormat.yMMMEd();
    TextStyle dateStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.normal);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit), color: Colors.white, onPressed: null)
        ],
        title: Column(children: [
          Row(
            children: <Widget>[
              Text(flightSearch.departureAirport),
              Transform.rotate(
                angle: 140,
                child: Icon(Icons.import_export),
              ),
              Text(flightSearch.arrivalAirport)
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                dateFormat.format(flightSearch.departureDate) + " - ",
                style: dateStyle,
              ),
              Text(
                dateFormat.format(flightSearch.returnDate),
                style: dateStyle,
              )
            ],
          ),
        ]),
      ),
      body: SafeArea(
        child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard()
            ]),
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Column(children: <Widget>[
                        ConnectionFlightRow(
                            airline: "etihad",
                            departureAirport: "WAW",
                            arrivalAirport: "HUY"),
                        ConnectionFlightRow(
                            airline: "wizzair",
                            departureAirport: "CND",
                            arrivalAirport: "XD"),
                      ])),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("2000 PLN",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down),
                          const Text(
                            'Show details',
                          ),
                        ],
                      )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BookFlightScreen()))
                              },
                          child: const Text(
                            'Book',
                          )),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.favorite), onPressed: null)
                ],
              )
            ],
          ),
        ));
  }
}

class ConnectionFlightRow extends StatelessWidget {
  final String departureAirport;
  final String arrivalAirport;
  final String airline;
  const ConnectionFlightRow(
      {Key key, this.airline, this.departureAirport, this.arrivalAirport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _timeStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    TextStyle _durationStyle = TextStyle(fontSize: 14);

    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                  height: 50,
                  width: 50,
                  image: AssetImage('assets/images/airlines/$airline.png'),
                ),
                Text("22/06")
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Row(children: [Text("12:25", style: _timeStyle)]),
              Row(children: [Text(departureAirport)])
            ]),
            Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Colors.black38))),
                    child: Text("9h 15min", style: _durationStyle))
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Row(children: [Text("22:25", style: _timeStyle)]),
              Row(children: [Text(arrivalAirport)])
            ]),
          ]),
    );
  }
}
// Observer(
//   builder: (_) => Column(
//       children: <Widget>[Text('${flightSearch.departureAirport}')]),
// ),
