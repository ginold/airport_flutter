import 'package:airport_flutter/store/booking/flightBooking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class BookingConfirmationScreen extends StatefulWidget {
  BookingConfirmationScreen({Key key}) : super(key: key);

  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final FlightBooking booking =
        Provider.of<FlightBooking>(context, listen: false);

    Future.delayed(Duration.zero, () => _showAlert(context, booking));

    return Scaffold(body: SafeArea(child: Text("asd")));
  }

  void _showAlert(BuildContext context, booking) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Ready, steady, go!"),
              content: Text("welcome aboard, " + booking.passenger.name),
              actions: [
                FlatButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: Text("hell yaeh!"))
              ],
              elevation: 20,
            ));
  }
}
