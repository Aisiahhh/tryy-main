import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerProvider with ChangeNotifier {
  final List<MarkerModel> _markers = [];

  List<MarkerModel> get markers => _markers;

  void addMarker(LatLng position) {
    _markers.add(MarkerModel(position));
    notifyListeners();
  }
}

class MarkerModel {
  final LatLng position;

  MarkerModel(this.position);
}

