import 'package:flutter/material.dart';
import 'dart:async';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';
import 'package:airport_flutter/store/flightSearch/flightSearch.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime> picked = new List(2);

  Future _selectDate(BuildContext context) async {
    final flight = Provider.of<FlightSearch>(context, listen: false);
    DateTime _departureDate = new DateTime.now();
    DateTime _returnDate = (new DateTime.now()).add(new Duration(days: 7));

    picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _departureDate,
        initialLastDate: _returnDate,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2022));
    if (picked != null) {
      setState(() {
        picked = picked;
      });
      if (picked.length == 2) {
        _returnDate = picked[0];
        _departureDate = picked[1];
        flight.setReturnDate(picked[0]);
        flight.setDepartureDate(picked[1]);
      } else {
        _departureDate = picked[0];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: new BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.red, width: .4))),
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Departure',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    DateButton(
                        date: picked[0],
                        onDateSelected: () {
                          _selectDate(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Arrival',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    DateButton(
                        date: picked[1],
                        onDateSelected: () {
                          _selectDate(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateButton extends StatefulWidget {
  final VoidCallback onDateSelected;
  final DateTime date;

  DateButton({Key key, this.date, this.onDateSelected}) : super(key: key);

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  String buttonDate = '';
  DateFormat dateFormat = DateFormat("d LLLL yyyy");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.white,
            textColor: Theme.of(context).primaryColor,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            splashColor: Colors.blueAccent,
            onPressed: () {
              widget.onDateSelected();
            },
            child: Text(
              widget.date == null
                  ? 'Select date'
                  : dateFormat.format(widget.date),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
