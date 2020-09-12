import 'package:airport_flutter/screens/destination_details_screen.dart';
import 'package:airport_flutter/store/destination/destination.dart';
import 'package:flutter/material.dart';

class DestinationsScreen extends StatelessWidget {
  DestinationsScreen({Key key}) : super(key: key);

  final List<Destination> destinations = Destination.allDestinations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView.builder(
                cacheExtent: 50,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: destinations.length,
                addAutomaticKeepAlives: true,
                itemBuilder: (BuildContext context, int i) {
                  return DestinationListItem(
                      destination: destinations[i], delay: i > 3 ? 1 : i);
                })));
  }
}

class DestinationListItem extends StatefulWidget {
  final Destination destination;
  final int delay;
  DestinationListItem({Key key, this.destination, this.delay})
      : super(key: key);

  @override
  _DestinationListItemState createState() => _DestinationListItemState();
}

class _DestinationListItemState extends State<DestinationListItem>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(widget.delay * 0.1, 1, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DestinationDetailsScreen(destination: widget.destination))),
      child: SlideTransition(
          position: _offsetAnimation,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: widget.destination.city,
                        child: Container(
                          height: 120,
                          width: 100,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22)),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(widget.destination.imgUrl),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.destination.city),
                                Text(
                                  widget.destination.description,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                                Text(
                                  '10 Activities',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      )
                    ]),
              ),
            ),
          )),
    );
  }
}
