import 'package:airport_flutter/screens/flight_search_screen.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'airport_textinput.dart';

class FlightSearchOpenContainer extends StatelessWidget {
  const FlightSearchOpenContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return FlightSearchScreen();
        },
        tappable: true,
        closedElevation: 0.0,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Find a flight',
                    style: TextStyle(color: Colors.black87, fontSize: 25)),
                GestureDetector(
                    onTap: openContainer,
                    child: AirportTextInput(
                        direction: 'from', openContainer: true))
              ]);
        },
      ),
    );
  }
}
