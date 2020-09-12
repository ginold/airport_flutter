// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightSearch.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlightSearch on _FlightSearch, Store {
  final _$returnDateAtom = Atom(name: '_FlightSearch.returnDate');

  @override
  DateTime get returnDate {
    _$returnDateAtom.context.enforceReadPolicy(_$returnDateAtom);
    _$returnDateAtom.reportObserved();
    return super.returnDate;
  }

  @override
  set returnDate(DateTime value) {
    _$returnDateAtom.context.conditionallyRunInAction(() {
      super.returnDate = value;
      _$returnDateAtom.reportChanged();
    }, _$returnDateAtom, name: '${_$returnDateAtom.name}_set');
  }

  final _$_FlightSearchActionController =
      ActionController(name: '_FlightSearch');

  @override
  void setReturnDate(dynamic date) {
    final _$actionInfo = _$_FlightSearchActionController.startAction();
    try {
      return super.setReturnDate(date);
    } finally {
      _$_FlightSearchActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartureDate(dynamic date) {
    final _$actionInfo = _$_FlightSearchActionController.startAction();
    try {
      return super.setDepartureDate(date);
    } finally {
      _$_FlightSearchActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepartureAirport(dynamic airport) {
    final _$actionInfo = _$_FlightSearchActionController.startAction();
    try {
      return super.setDepartureAirport(airport);
    } finally {
      _$_FlightSearchActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArrivalAirport(dynamic airport) {
    final _$actionInfo = _$_FlightSearchActionController.startAction();
    try {
      return super.setArrivalAirport(airport);
    } finally {
      _$_FlightSearchActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'returnDate: ${returnDate.toString()}';
    return '{$string}';
  }
}
