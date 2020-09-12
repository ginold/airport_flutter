import 'package:mobx/mobx.dart';
import '../passenger/passenger.dart';

part 'booking.g.dart';

// This is the class used by rest of your codebase
class Booking = _Booking with _$Booking;

abstract class _Booking with Store {
  @observable
  String type = 'flight';
  DateTime startDate;
  DateTime endDate;
  double price;

  _Booking(type, startDate, endDate, price);

  @action
  void setEndDate(date) {
    endDate = date;
  }

  @action
  void setStartDate(date) {
    startDate = date;
  }

  @action
  void setType(type) {
    type = type;
  }

  @action
  void setPrice(double price) {
    price = price;
  }
}
