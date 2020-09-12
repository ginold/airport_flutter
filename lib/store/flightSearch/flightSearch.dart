import 'package:mobx/mobx.dart';

part 'flightSearch.g.dart';

// This is the class used by rest of your codebase
class FlightSearch = _FlightSearch with _$FlightSearch;

abstract class _FlightSearch with Store {
  @observable
  DateTime returnDate;
  DateTime departureDate;
  String departureAirport;
  String arrivalAirport;

  @action
  void setReturnDate(date) {
    returnDate = date;
  }

  @action
  void setDepartureDate(date) {
    departureDate = date;
  }

  @action
  void setDepartureAirport(airport) {
    departureAirport = airport;
  }

  @action
  void setArrivalAirport(airport) {
    arrivalAirport = airport;
  }
}
