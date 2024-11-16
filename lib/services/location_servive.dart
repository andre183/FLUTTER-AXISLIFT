import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  Future<dynamic> getRoute(String origin, String destination) async {
    final String url =
        '${_baseUrl}origin=$origin&destination=$destination&key=AIzaSyAuAZsPb-Sw6nNP7fCZtI1PqcNxEMj7JL0';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['routes'][0];
    } else {
      throw Exception('Failed to load route');
    }
  }

  double calculateFare(dynamic route) {
    // This is a simplified fare calculation. You might want to adjust this based on your pricing model.
    int distanceInMeters = route['legs'][0]['distance']['value'];
    int durationInSeconds = route['legs'][0]['duration']['value'];

    double baseFare = 20.0; // Base fare in Rand
    double perKilometerRate = 7.0; // Rate per kilometer in Rand
    double perMinuteRate = 2.0; // Rate per minute in Rand

    double distanceFare = (distanceInMeters / 1000) * perKilometerRate;
    double timeFare = (durationInSeconds / 60) * perMinuteRate;

    return baseFare + distanceFare + timeFare;
  }
}