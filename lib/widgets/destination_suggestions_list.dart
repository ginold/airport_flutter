import 'package:airport_flutter/screens/destination_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:airport_flutter/store/destination/destination.dart';
import 'package:airport_flutter/screens/destinations_screen.dart';

class DestinationSuggestionsList extends StatelessWidget {
  final List<Destination> destinations =
      Destination.allDestinations.take(4).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Discover destinations',
                      style: TextStyle(color: Colors.black87, fontSize: 25)),
                ),
                GestureDetector(
                    onTap: () => print("tap"),
                    child: FlatButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DestinationsScreen())),
                      child: Text(
                        'see more',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )),
              ],
            ),
            Container(
              height: 280,
              child: ListView.builder(
                  cacheExtent: 50,
                  addAutomaticKeepAlives: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int i) {
                    Destination d = destinations[i];
                    return DestinationListItem(d: d);
                  }),
            )
          ],
        ));
  }
}

class DestinationListItem extends StatefulWidget {
  final Destination d;
  DestinationListItem({Key key, this.d}) : super(key: key);

  @override
  _DestinationListItemState createState() => _DestinationListItemState();
}

class _DestinationListItemState extends State<DestinationListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final destinationCityCountry = getDestinationCityCountry(widget.d);

    return Container(
        child: InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DestinationDetailsScreen(destination: widget.d))),
      child: Container(
          width: 140,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: 180,
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration:
                      BoxDecoration(color: Colors.transparent, boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 10,
                    )
                  ]),
                  child: Hero(
                    tag: widget.d.city,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.d.imgUrl),
                        )),
                  ),
                ),
                Positioned(child: destinationCityCountry, bottom: 20, left: 20)
              ]),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('10 Activities',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        widget.d.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      )
                    ]),
              )
            ],
          )),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

Widget getDestinationCityCountry(d) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          d.city,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.near_me,
                  color: Colors.white,
                ),
              ),
              Text(
                d.country,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ]);
}
