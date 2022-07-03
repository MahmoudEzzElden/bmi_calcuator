import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  static currentLocation() async {
    return await _permission();
  }

  static Future<Position> _permission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print('Location needed');
    }
    permission = await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
