import 'package:airport_flutter/screens/booking_confirmation_screen.dart';
import 'package:airport_flutter/store/booking/flightBooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

String validateName(String value) {
  if (value.length < 3)
    return 'Name must be more than 2 charater';
  else
    return null;
}

String validateMobile(String value) {
  if (value.length > 10)
    return 'Mobile Number must be less than 10 digits';
  else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value.trim()))
    return 'Enter a Valid Email';
  else
    return null;
}

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class BookFlightScreen extends StatefulWidget {
  BookFlightScreen({Key key}) : super(key: key);

  @override
  _BookFlightScreenState createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {
  int currentStep = 0;
  bool complete = false;
  String month = 'Month';
  List<Step> steps = <Step>[];

  bool _getIsActive(int step) {
    return currentStep == step;
  }

  StepState _getStepState(int step) {
    return StepState.indexed;
  }

  void next() {
    // if (formKeys[currentStep].currentState.validate()) {
    if (currentStep + 1 != steps.length) {
      goTo(currentStep + 1);
    } else {
      setState(() => complete = true);
    }
    // }
  }

  void cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  void goTo(int step) {
    setState(() => currentStep = step);
  }

  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<Step> _getSteps(BuildContext context, FlightBooking booking) {
    steps = [
      Step(
        title: const Text('Passenger details'),
        isActive: _getIsActive(0),
        state: _getStepState(0),
        content: Form(
          key: formKeys[0],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (text) {
                  var passenger = booking.passenger;
                  passenger.name = text;
                  booking.passenger = passenger;
                },
                validator: validateName,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                onChanged: (text) {
                  var passenger = booking.passenger;
                  passenger.surname = text;
                  booking.passenger = passenger;
                },
                validator: validateName,
                decoration: InputDecoration(labelText: 'Surname'),
              ),
              TextFormField(
                onChanged: (text) {
                  var passenger = booking.passenger;
                  passenger.email = text;
                  booking.passenger = passenger;
                },
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              TextFormField(
                onChanged: (text) {
                  var passenger = booking.passenger;
                  passenger.phoneNumber = text;
                  booking.passenger = passenger;
                },
                keyboardType: TextInputType.number,
                validator: validateMobile,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'Phone number'),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Brith date", style: TextStyle(color: Colors.black45)),
              Row(children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      var passenger = booking.passenger;
                      var date = passenger.birthDate.toLocal();
                      passenger.birthDate =
                          new DateTime(date.year, date.month, int.parse(text));
                      booking.passenger = passenger;
                    },
                    maxLength: 2,
                    maxLengthEnforced: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Day"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  hint: Text(month),
                  items: monthNames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (text) {
                    setState(() {
                      month = text;
                    });
                    var passenger = booking.passenger;
                    var date = passenger.birthDate.toLocal();
                    passenger.birthDate = new DateTime(
                        date.year, monthNames.indexOf(text) + 1, date.day);
                    booking.passenger = passenger;
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      var passenger = booking.passenger;
                      var date = passenger.birthDate.toLocal();
                      passenger.birthDate =
                          new DateTime(int.parse(text), date.month, date.year);
                      booking.passenger = passenger;
                    },
                    maxLength: 4,
                    maxLengthEnforced: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Year"),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
      Step(
        isActive: _getIsActive(1),
        state: _getStepState(1),
        title: const Text('Additional services'),
        content: Form(
          key: formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaggageSelection(),
              TravelInsurance(),
              SmsNotification()
            ],
          ),
        ),
      ),
      Step(
        isActive: _getIsActive(2),
        state: _getStepState(2),
        title: const Text('Confirmation'),
        content: Form(
          key: formKeys[2],
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red,
              ),
              Text(booking.passenger.name),
              Text(booking.passenger.email),
              Text(booking.passenger.surname),
              Text(booking.passenger.birthDate.toString()),
              Text(booking.passenger.phoneNumber),
              Text(booking.type),
              Text(booking.baggageOption),
              Text(booking.insuranceOption),
              Text(booking.smsNotification.toString()),
            ],
          ),
        ),
      ),
    ];
    return steps;
  }

  List<Widget> _getButtons() {
    List<Widget> buttons = [];
    if (currentStep > 0) {
      buttons.add(FlatButton(
        color: Theme.of(context).primaryColor,
        onPressed: cancel,
        child: Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    if (currentStep < steps.length - 1) {
      buttons.add(FlatButton(
        color: Theme.of(context).primaryColor,
        onPressed: next,
        child: Text(
          'Next',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    if (currentStep == steps.length - 1) {
      buttons.add(FlatButton(
        color: Colors.orangeAccent,
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookingConfirmationScreen()))
        },
        child: Text(
          'CONFIRM BOOKING',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final FlightBooking booking =
        Provider.of<FlightBooking>(context, listen: false);
    return Scaffold(
        floatingActionButton: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                  builder: (_) => Text(
                        booking.price.toString() + ' USD',
                        style: TextStyle(color: Colors.white),
                      )),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.flight,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Destinations",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Observer(
                builder: (_) => Text(
                      booking.price.toString() +
                          ' USD' +
                          booking.passenger.name,
                      style: TextStyle(color: Colors.white),
                    )),
            Expanded(
              child: Stepper(
                steps: _getSteps(context, booking),
                onStepContinue: next,
                onStepTapped: (step) => goTo(step),
                onStepCancel: cancel,
                currentStep: currentStep,
                type: StepperType.vertical,
                physics: BouncingScrollPhysics(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[..._getButtons()]));
                },
              ),
            ),
          ],
        )));
  }
}

class SmsNotification extends StatefulWidget {
  SmsNotification({Key key}) : super(key: key);

  @override
  _SmsNotificationState createState() => _SmsNotificationState();
}

class _SmsNotificationState extends State<SmsNotification> {
  bool _groupValue = false;

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<FlightBooking>(context, listen: false);

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Icon(Icons.sms, color: Colors.black54),
          SizedBox(width: 10),
          Text(
            "SMS NOTIFIACTION",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 10),
      Container(
          child: Column(
        children: <Widget>[
          Text("Do you wish to receive a SMS notification?"),
          Row(
            children: <Widget>[
              Radio(
                value: true,
                groupValue: _groupValue,
                onChanged: (T) {
                  setState(() {
                    _groupValue = T;
                  });
                  booking.smsNotification = true;
                },
              ),
              Text(
                'Yes',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(width: 20),
              Radio(
                value: false,
                groupValue: _groupValue,
                onChanged: (T) {
                  setState(() {
                    _groupValue = T;
                  });
                  booking.setSmsNotification(false);
                },
              ),
              Text(
                'No',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          )
        ],
      ))
    ]);
  }
}

class BaggageSelection extends StatefulWidget {
  BaggageSelection({Key key}) : super(key: key);

  @override
  _BaggageSelectionState createState() => _BaggageSelectionState();
}

class _BaggageSelectionState extends State<BaggageSelection> {
  String _groupValue = "baggage_value";

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<FlightBooking>(context, listen: false);

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.local_activity, color: Colors.black54),
              SizedBox(width: 10),
              Text(
                "BAGGAGE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(children: [
                Expanded(
                    flex: 7,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "cabin_bag",
                          groupValue: _groupValue,
                          onChanged: (T) {
                            setState(() {
                              _groupValue = T;
                            });
                            booking.baggageOption = T;
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Cabin bag"),
                            Text("50 x 23 x 36 cm, 5kg",
                                style: TextStyle(fontSize: 14))
                          ],
                        ),
                      ],
                    )),
                Expanded(flex: 2, child: Text("0 PLN"))
              ])),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(children: [
                Expanded(
                    flex: 7,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "checked_bag",
                          groupValue: _groupValue,
                          onChanged: (T) {
                            setState(() {
                              _groupValue = T;
                            });
                            booking.price += 220;
                            booking.baggageOption = T;
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("20 kg Checked bag"),
                            Text("78 × 28 × 52 cm, 20 kg",
                                style: TextStyle(fontSize: 14))
                          ],
                        ),
                      ],
                    )),
                Expanded(flex: 2, child: Text("220 PLN"))
              ])),
        ],
      ),
    );
  }
}

class TravelInsurance extends StatefulWidget {
  TravelInsurance({Key key}) : super(key: key);

  @override
  _TravelInsuranceState createState() => _TravelInsuranceState();
}

class _TravelInsuranceState extends State<TravelInsurance> {
  String _groupValue = "group_value";

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<FlightBooking>(context, listen: false);
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.security, color: Colors.black54),
                SizedBox(width: 10),
                Text(
                  "TRAVEL INSURANCE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.security,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(width: 10),
                          Text("Travel plus"),
                          Text("  + 35 pln",
                              style: TextStyle(color: Colors.red)),
                        ],
                      ),
                      Radio(
                        value: "travel_plus",
                        groupValue: _groupValue,
                        onChanged: (T) {
                          setState(() {
                            _groupValue = T;
                          });
                          booking.price += 35;
                          booking.setInsuranceOption(T);
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.security,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Text("Travel basic"),
                          Text("  + 22 pln",
                              style: TextStyle(color: Colors.red)),
                        ],
                      ),
                      Radio(
                          groupValue: _groupValue,
                          value: "travel_basic",
                          onChanged: (T) {
                            setState(() {
                              _groupValue = T;
                            });
                            booking.price += 22;
                            booking.setInsuranceOption(T);
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.not_interested,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Text("No insurance"),
                        ],
                      ),
                      Radio(
                          groupValue: _groupValue,
                          value: "no_insurance",
                          onChanged: (T) {
                            setState(() {
                              _groupValue = T;
                            });
                            booking.setInsuranceOption(T);
                          })
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
