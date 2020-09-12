import 'package:mobx/mobx.dart';
import '../passenger/passenger.dart';
part 'flightBooking.g.dart';

class FlightBooking = _FlightBooking with _$FlightBooking;

abstract class _FlightBooking with Store {
  @observable
  Passenger passenger =
      Passenger('name', 'surname', DateTime.now(), 'email', '223');
  @observable
  String baggageOption = '';
  @observable
  bool smsNotification = false;
  @observable
  String insuranceOption = '';

  String type = 'flight';

  @observable
  DateTime startDate = DateTime.now();

  @observable
  DateTime endDate = DateTime.now();

  @observable
  int price = 0;

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
  void setInsuranceOption(String option) {
    insuranceOption = option;
  }

  @action
  void setBaggageOption(String option) {
    baggageOption = option;
  }

  @action
  void setSmsNotification(bool yesno) {
    smsNotification = yesno;
  }

  @action
  void setPassenger(Passenger passenger) {
    passenger = passenger;
  }

  // _FlightBooking(
  //     {type,
  //     startDate,
  //     endDate,
  //     price,
  //     this.passenger,
  //     this.luggageOption,
  //     this.insuranceOption})
  //     : super(type, startDate, endDate, price);
}
