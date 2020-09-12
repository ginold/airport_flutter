import 'package:airport_flutter/screens/book_flight_screen.dart';
import 'package:airport_flutter/screens/flight_search_results_screen.dart';
import 'package:airport_flutter/store/booking/flightBooking.dart';
import 'package:airport_flutter/store/flightSearch/flightSearch.dart';
import 'package:flutter/material.dart';
import 'package:airport_flutter/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(TravelMainApp());

class TravelMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlightSearch>(
          create: (_) => FlightSearch(),
          // dispose: (_, flight) => flight.dispose(),
        ),
        Provider<FlightBooking>(
          create: (_) => FlightBooking(),
          // dispose: (_, booking) => booking.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Travelonely',
        theme: ThemeData(
          fontFamily: 'Lato',
          hoverColor: Colors.orange,
          primarySwatch: Colors.orange, // alert dialog button
          primaryColor: Colors.indigoAccent,
          accentColor: Colors.pink[600],
          textTheme: TextTheme(
            button: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            headline1: TextStyle(fontSize: 343.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
                fontSize: 39.0, fontWeight: FontWeight.bold), // alert title
            bodyText1: TextStyle(fontSize: 22, color: Colors.lightBlue),
            bodyText2: TextStyle(fontSize: 17.0, fontStyle: FontStyle.normal),
          ),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            },
          ),
        ),
        // home: BookFlightScreen(),
        home: HomeScreen(),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/home': (context) => HomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/flights/results': (context) => FlightSearchResultsScreen(),
        },
      ),
    );
  }
}
