class Destination {
  String city;
  String country;
  List<Activity> activities;
  String imgUrl;
  String description;
  Map<String, double> location;

  Destination(
      {this.city,
      this.country,
      this.activities,
      this.description,
      this.location,
      this.imgUrl});

  Destination.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        country = json['country'];

  static final allDestinations = destinations;
}

class Activity {
  String name;
  String type;
  String imgUrl;
  int rating;
  int price;
  List<String> hours;
  Activity(
      {this.name, this.type, this.rating, this.price, this.hours, this.imgUrl});
}

List<Activity> activities = [
  Activity(
    imgUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    hours: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imgUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    hours: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imgUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    hours: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];
List<Destination> destinations = [
  Destination(
    city: 'Paris',
    location: {'lat': 48.856613, 'lng': 2.352222},
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    country: 'France',
    imgUrl: 'assets/images/destinations/paris.jpg',
  ),
  Destination(
    city: 'Berlin',
    location: {'lat': 52.5200, 'lng': 13.4050},
    description: 'Visit Berlin for an amazing and unforgettable adventure.',
    country: 'Germany',
    imgUrl: 'assets/images/destinations/berlin.jpg',
  ),
  Destination(
    city: 'Cracow',
    location: {'lat': 50.0647, 'lng': 19.9450},
    description: 'Visit Cracow for an amazing and unforgettable adventure.',
    country: 'Poland',
    imgUrl: 'assets/images/destinations/cracow.jpg',
  ),
  Destination(
    city: 'Warsaw',
    location: {'lat': 52.2297, 'lng': 21.0122},
    description: 'Visit Warsaw for an amazing and unforgettable adventure.',
    country: 'Poland',
    imgUrl: 'assets/images/destinations/warsaw.jpg',
  ),
  Destination(
    city: 'Venice',
    location: {'lat': 45.4408, 'lng': 12.3155},
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    country: 'Italy',
    activities: activities,
    imgUrl: 'assets/images/destinations/venice.jpg',
  ),
  Destination(
    city: 'Prague',
    location: {'lat': 50.075539, 'lng': 14.437800},
    description: 'Visit Prague or an amazing and unforgettable adventure.',
    country: 'Czech Republic',
    imgUrl: 'assets/images/destinations/prague.jpg',
  ),
  Destination(
    imgUrl: 'assets/images/destinations/newdehli.jpg',
    city: 'New Delhi',
    location: {'lat': 28.613939, 'lng': 77.209023},
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imgUrl: 'assets/images/destinations/saopaulo.jpg',
    city: 'Sao Paulo',
    location: {'lat': -23.550520, 'lng': -46.633308},
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    city: 'New York City',
    location: {'lat': 40.712776, 'lng': -74.005974},
    imgUrl: 'assets/images/destinations/newyork.jpg',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
