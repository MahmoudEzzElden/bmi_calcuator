import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/place.dart';
import '../services/geolocator.dart';

//PlacesModel? placesModel;

class LocationProvider with ChangeNotifier {
  //List places = [];
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

  // Future<PlacesModel?> getPlaces(double lat, double lng) async {
  //   int radius = 2000;
  //   const String myKey = 'AIzaSyC4N11SeNXR4oV8zNmPr7t5AzAoaTOWXzY';
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/place/nearbysearch/json?&location=$lat,$lng&radius=$radius&key=$myKey&type=gym';
  //   Dio? dio = Dio();
  //
  //   try {
  //     Response response = await dio.get(url);
  //     placesModel = PlacesModel.fromJson(response.data);
  //     print('Status Code: ${response.statusCode}');
  //   } on DioError catch (error) {
  //     print('Error: ${error.message}');
  //   }
  //   notifyListeners();
  //   return placesModel;
  // }
}
