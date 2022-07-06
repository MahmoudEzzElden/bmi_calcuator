import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/geolocator.dart';


class LocationProvider with ChangeNotifier {

  Position? currentLocation;
  Set<Marker> myMarker = {};

  addNewMarker(LatLng latlng, MarkerId markerId) {
    myMarker.add(Marker(
        markerId: markerId,
        position: latlng,
        infoWindow: InfoWindow(title: markerId.value)));
    notifyListeners();
  }

  setCurrentLocation() async {
    currentLocation = await GeoLocatorService.currentLocation();
    notifyListeners();
  }

}
