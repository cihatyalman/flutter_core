// Documents and Integration
// https://pub.dev/packages/screenshot
// *https://pub.dev/packages/google_maps_flutter

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  GoogleMapController? _controller;
  final markerListNotifier = ValueNotifier(List<Marker>.empty(growable: true));
  final centerPosNotifier = ValueNotifier<CameraPosition?>(null);

  Widget build({
    required LatLng initialLatLng,
    double initialZoom = 14,
    List<Marker>? markerList,
    void Function(LatLng latLng)? onTap,
    void Function(CameraPosition position)? onCameraMove,
    void Function()? onCameraIdle,
  }) {
    if (markerList != null) {
      markerListNotifier.value = markerList;
    }
    return ValueListenableBuilder<List<Marker>>(
      valueListenable: markerListNotifier,
      builder: (_, value, __) {
        return GoogleMap(
          initialCameraPosition:
              CameraPosition(target: initialLatLng, zoom: initialZoom),
          onMapCreated: (controller) => _controller = controller,
          onCameraMove: (position) {
            centerPosNotifier.value = position;
            onCameraMove?.call(position);
          },
          onCameraIdle: onCameraIdle,
          buildingsEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          markers: value.toSet(),
          onTap: onTap,
        );
      },
    );
  }

  Future<BitmapDescriptor> createMarkerIcon(Widget widget) async {
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

  void goLocation({required LatLng latLng, double zoom = 14}) {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: zoom),
    ));
  }
}
