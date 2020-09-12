import 'package:airport_flutter/store/destination/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

List<Destination> destinations = Destination.allDestinations;

class DestinationMapScreen extends StatefulWidget {
  DestinationMapScreen({Key key}) : super(key: key);

  @override
  _DestinationMapScreenState createState() => _DestinationMapScreenState();
}

class _DestinationMapScreenState extends State<DestinationMapScreen> {
  List<Polyline> _polylines = [];
  String lastClickedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Where we fly",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(50.5260, 8.2551),
          zoom: 4,
        ),
        layers: [
          TileLayerOptions(
              // "https://api.mapbox.com/styles/v1/ginold/cka12b5j84vx01ipp5rkkllo0/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ2lub2xkIiwiYSI6ImNrYTEyZHFrNDBpMHozZW42ZmtudW52ZDkifQ.rOu-fg4qHweXrgcKOV47tA"
              // urlTemplate: "https://api.tiles.mapbox.com/v4/"
              //     "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/ginold/cka13bltv4wzo1isake0jnm4g/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
              additionalOptions: {
                'id': 'mapbox.mapbox-streets-v8',
                'accessToken':
                    'pk.eyJ1IjoiZ2lub2xkIiwiYSI6ImNrYTEyZHFrNDBpMHozZW42ZmtudW52ZDkifQ.rOu-fg4qHweXrgcKOV47tA'
              }),
          PolylineLayerOptions(polylines: _polylines),
          MarkerLayerOptions(
            markers: [
              // ..._getCityNames(destinations, context),
              ..._getMarkers(destinations, context),
            ],
          ),
        ],
      ),
    );
  }

  void _createCurvedLines(Destination destination, context) {
    var lines = <Polyline>[];

    for (var d in destinations) {
      lines.add(Polyline(
        points: [
          LatLng(destination.location['lat'], destination.location['lng']),
          LatLng(d.location['lat'], d.location['lng'])
        ],
        strokeWidth: 3,
        color: Theme.of(context).primaryColor.withOpacity(.8),
      ));
    }
    setState(() {
      _polylines = lines;
    });
  }

  List<Marker> _getCityNames(List<Destination> destinations, context) {
    List<Marker> markers = [];
    for (var d in destinations) {
      markers.add(Marker(
          width: 100.0,
          height: 100.0,
          anchorPos: AnchorPos.align(AnchorAlign.right),
          point: LatLng(d.location['lat'], d.location['lng']),
          builder: (ctx) => Container(
                child: Text(d.city,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                        fontSize: 17)),
              )));
    }
    return markers;
  }

  List<Marker> _getMarkers(List<Destination> destinations, context) {
    List<Marker> markers = [];
    for (var d in destinations) {
      markers.add(Marker(
        width: 160.0,
        height: 100.0,
        anchorPos: AnchorPos.align(AnchorAlign.center),
        point: LatLng(d.location['lat'], d.location['lng']),
        builder: (ctx) => Row(
          children: <Widget>[
            Text(d.city,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                    fontSize: 17)),
            IconButton(
                icon: Icon(Icons.place,
                    color: Theme.of(context).accentColor.withOpacity(.7)),
                onPressed: () {
                  if (_polylines.length == 0 || lastClickedCity != d.city) {
                    _createCurvedLines(d, context);
                  } else if (lastClickedCity == d.city) {
                    setState(() {
                      _polylines = [];
                    });
                  }
                  lastClickedCity = d.city;
                }),
          ],
        ),
      ));
    }
    return markers;
  }
}
