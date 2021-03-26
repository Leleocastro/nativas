import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyDGpDiIXnoeTGRiJydEYLQalRZtSahaWLc';

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    print(latitude);
    print(longitude);
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=-15.7107438,-47.908989&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C-15.7107438,-47.908989&key=AIzaSyDGpDiIXnoeTGRiJydEYLQalRZtSahaWLc';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final Uri url = Uri.https(
      "maps.googleapis.com",
      "/maps/api/geocode/json",
      {
        "latlng": "${position.latitude},${position.longitude}",
        "key": GOOGLE_API_KEY,
      },
    );
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
