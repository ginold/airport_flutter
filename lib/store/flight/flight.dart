import 'package:airport_flutter/store/destination/destination.dart';

class Flight {
  DateTime returnDate;
  DateTime departureDate;
  String departureAirport;
  String arrivalAirport;
  Destination destination;

  double price;
  String airline;
  String airlineImgUrl;
  String flightClass;
  String luggageWeight;

  Flight();
}
