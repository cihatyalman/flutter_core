// Documents and Integration
// *https://pub.dev/packages/geolocator
// https://pub.dev/packages/geocoding

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final locationService = LocationService();

class LocationService {
  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return null;
    }
  }

  Future<List<Placemark>?> getAddressFromLatLng(
      double? lat, double? lng) async {
    if (lat == null || lng == null) {
      return null;
    }

    try {
      var placeMarkList = await placemarkFromCoordinates(lat, lng);
      return placeMarkList;
    } catch (e) {
      return null;
    }
  }

  Future<List<Location>?> getLatLngFromAddress(String? address) async {
    if (address == null) {
      return null;
    }
    try {
      var locationList = await locationFromAddress(address);
      return locationList;
    } catch (e) {
      return null;
    }
  }
}
