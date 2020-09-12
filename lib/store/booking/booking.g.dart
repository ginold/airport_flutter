// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Booking on _Booking, Store {
  final _$typeAtom = Atom(name: '_Booking.type');

  @override
  String get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$_BookingActionController = ActionController(name: '_Booking');

  @override
  void setEndDate(dynamic date) {
    final _$actionInfo = _$_BookingActionController.startAction();
    try {
      return super.setEndDate(date);
    } finally {
      _$_BookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDate(dynamic date) {
    final _$actionInfo = _$_BookingActionController.startAction();
    try {
      return super.setStartDate(date);
    } finally {
      _$_BookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(dynamic type) {
    final _$actionInfo = _$_BookingActionController.startAction();
    try {
      return super.setType(type);
    } finally {
      _$_BookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(double price) {
    final _$actionInfo = _$_BookingActionController.startAction();
    try {
      return super.setPrice(price);
    } finally {
      _$_BookingActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'type: ${type.toString()}';
    return '{$string}';
  }
}
