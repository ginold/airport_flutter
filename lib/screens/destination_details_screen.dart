import 'package:airport_flutter/store/destination/destination.dart';
import 'package:flutter/material.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  DestinationDetailsScreen({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: destination.city,
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                snap: false,
                elevation: 50,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(destination.city + ', ' + destination.country),
                  background: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/destinations/${destination.city.toLowerCase()}.jpg')),
                ),
              ),
              new SliverList(
                  delegate: new SliverChildListDelegate(_buildActivityList(
                      destination.activities.length, context))),
            ],
          ),
        ),
      ),
    );
  }

  List _buildActivityList(int length, BuildContext context) {
    List<Widget> listItems = List();

    for (int i = 0; i < length; i++) {
      var activity = destination.activities[i];
      listItems.add(Padding(
          padding: EdgeInsets.all(15.0),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(activity.name, style: TextStyle(fontSize: 20)),
                  Text(activity.type,
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text('Rating',
                                  style: TextStyle(fontSize: 20))),
                          _getActivityStars(activity.rating),
                        ]),
                  ),
                  Row(children: _getHours(activity.hours, context))
                ],
              ),
            ),
          )));
    }

    return listItems;
  }

  Text _getActivityStars(int rating) {
    String stars = '';
    for (int i = 0; i <= rating; i++) {
      stars += '⭐';
    }
    return Text(stars, style: TextStyle(fontSize: 15));
  }

  List<Widget> _getHours(List<String> hours, ctx) {
    print(hours);
    List<Widget> hoursChips = [];

    for (int i = 0; i <= hours.length - 1; i++) {
      hoursChips.add(Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        child: Chip(
          backgroundColor: Theme.of(ctx).primaryColor.withOpacity(.6),
          label: Text(
            hours[i],
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ));
    }
    return hoursChips.toList();
  }
}
