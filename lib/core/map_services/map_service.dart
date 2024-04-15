// Documents and Integration
// https://pub.dev/packages/screenshot
// *https://pub.dev/packages/google_maps_flutter

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks, avoid_print

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
    void Function()? onCameraIdle,
    void Function()? onCameraMoveStarted,
    void Function(CameraPosition position)? onCameraMove,
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
          onCameraIdle: onCameraIdle,
          onCameraMoveStarted: onCameraMoveStarted,
          onCameraMove: (position) {
            centerPosNotifier.value = position;
            onCameraMove?.call(position);
          },
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
    try {
      return BitmapDescriptor.fromBytes(await ScreenshotController()
          .captureFromWidget(widget, delay: Duration.zero));
    } catch (e) {
      print("[C_MapError]: $e");
      return BitmapDescriptor.defaultMarker;
    }
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
      CameraPosition(target: latLng, zoom: zoom, tilt: 45),
    ));
  }
}
