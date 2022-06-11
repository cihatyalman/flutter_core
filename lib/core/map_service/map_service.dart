// Documents and Integration
// https://pub.dev/packages/screenshot
// *https://pub.dev/packages/google_maps_flutter

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapService = MapService();

class MapService {
  GoogleMapController? controller;
  final markerListNotifier = ValueNotifier(List<Marker>.empty(growable: true));

  Widget build({
    required CameraPosition initialCameraPosition,
    List<Marker>? markerList,
  }) {
    if (markerList != null) {
      markerListNotifier.value = markerList;
    }
    return ValueListenableBuilder<List<Marker>>(
      valueListenable: markerListNotifier,
      builder: (_, value, __) {
        return GoogleMap(
          onMapCreated: (controller) => this.controller = controller,
          initialCameraPosition: initialCameraPosition,
          buildingsEnabled: false,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          markers: value.toSet(),
        );
      },
    );
  }

  Future<BitmapDescriptor?> createMarker(Widget widget) async {
    return BitmapDescriptor.fromBytes(await ScreenshotController()
        .captureFromWidget(widget, delay: Duration.zero));
  }

  void addMarker(Marker marker) {
    markerListNotifier.value.add(marker);
    markerListNotifier.notifyListeners();
  }

  void removeMarker(String id) {
    markerListNotifier.value
        .removeWhere((element) => element.markerId == MarkerId(id));
    markerListNotifier.notifyListeners();
  }

  void clearMarkers() {
    markerListNotifier.value.clear();
    markerListNotifier.notifyListeners();
  }

  void goLocation({LatLng? latLng, double? zoom}) {
    controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: latLng != null
            ? LatLng(latLng.latitude - .005, latLng.longitude)
            : LatLng(0, 0),
        zoom: zoom ?? 14,
      ),
    ));
  }
}
