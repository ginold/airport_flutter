// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightBooking.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlightBooking on _FlightBooking, Store {
  final _$passengerAtom = Atom(name: '_FlightBooking.passenger');

  @override
  Passenger get passenger {
    _$passengerAtom.context.enforceReadPolicy(_$passengerAtom);
    _$passengerAtom.reportObserved();
    return super.passenger;
  }

  @override
  set passenger(Passenger value) {
    _$passengerAtom.context.conditionallyRunInAction(() {
      super.passenger = value;
      _$passengerAtom.reportChanged();
    }, _$passengerAtom, name: '${_$passengerAtom.name}_set');
  }

  final _$baggageOptionAtom = Atom(name: '_FlightBooking.baggageOption');

  @override
  String get baggageOption {
    _$baggageOptionAtom.context.enforceReadPolicy(_$baggageOptionAtom);
    _$baggageOptionAtom.reportObserved();
    return super.baggageOption;
  }

  @override
  set baggageOption(String value) {
    _$baggageOptionAtom.context.conditionallyRunInAction(() {
      super.baggageOption = value;
      _$baggageOptionAtom.reportChanged();
    }, _$baggageOptionAtom, name: '${_$baggageOptionAtom.name}_set');
  }

  final _$smsNotificationAtom = Atom(name: '_FlightBooking.smsNotification');

  @override
  bool get smsNotification {
    _$smsNotificationAtom.context.enforceReadPolicy(_$smsNotificationAtom);
    _$smsNotificationAtom.reportObserved();
    return super.smsNotification;
  }

  @override
  set smsNotification(bool value) {
    _$smsNotificationAtom.context.conditionallyRunInAction(() {
      super.smsNotification = value;
      _$smsNotificationAtom.reportChanged();
    }, _$smsNotificationAtom, name: '${_$smsNotificationAtom.name}_set');
  }

  final _$insuranceOptionAtom = Atom(name: '_FlightBooking.insuranceOption');

  @override
  String get insuranceOption {
    _$insuranceOptionAtom.context.enforceReadPolicy(_$insuranceOptionAtom);
    _$insuranceOptionAtom.reportObserved();
    return super.insuranceOption;
  }

  @override
  set insuranceOption(String value) {
    _$insuranceOptionAtom.context.conditionallyRunInAction(() {
      super.insuranceOption = value;
      _$insuranceOptionAtom.reportChanged();
    }, _$insuranceOptionAtom, name: '${_$insuranceOptionAtom.name}_set');
  }

  final _$startDateAtom = Atom(name: '_FlightBooking.startDate');

  @override
  DateTime get startDate {
    _$startDateAtom.context.enforceReadPolicy(_$startDateAtom);
    _$startDateAtom.reportObserved();
    return super.startDate;
  }

  @override
  set startDate(DateTime value) {
    _$startDateAtom.context.conditionallyRunInAction(() {
      super.startDate = value;
      _$startDateAtom.reportChanged();
    }, _$startDateAtom, name: '${_$startDateAtom.name}_set');
  }

  final _$endDateAtom = Atom(name: '_FlightBooking.endDate');

  @override
  DateTime get endDate {
    _$endDateAtom.context.enforceReadPolicy(_$endDateAtom);
    _$endDateAtom.reportObserved();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.context.conditionallyRunInAction(() {
      super.endDate = value;
      _$endDateAtom.reportChanged();
    }, _$endDateAtom, name: '${_$endDateAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_FlightBooking.price');

  @override
  int get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(int value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$_FlightBookingActionController =
      ActionController(name: '_FlightBooking');

  @override
  void setEndDate(dynamic date) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setEndDate(date);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDate(dynamic date) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setStartDate(date);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(dynamic type) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setType(type);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInsuranceOption(String option) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setInsuranceOption(option);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaggageOption(String option) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setBaggageOption(option);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSmsNotification(bool yesno) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setSmsNotification(yesno);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassenger(Passenger passenger) {
    final _$actionInfo = _$_FlightBookingActionController.startAction();
    try {
      return super.setPassenger(passenger);
    } finally {
      _$_FlightBookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'passenger: ${passenger.toString()},baggageOption: ${baggageOption.toString()},smsNotification: ${smsNotification.toString()},insuranceOption: ${insuranceOption.toString()},startDate: ${startDate.toString()},endDate: ${endDate.toString()},price: ${price.toString()}';
    return '{$string}';
  }
}
