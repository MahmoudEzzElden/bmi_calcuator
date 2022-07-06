import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/place.dart';
PlacesModel? placesModel;
class PlaceProvider with ChangeNotifier{
  List places = [];
  Future<PlacesModel?> getPlaces(double lat, double lng) async {
    int radius = 2000;
    const String myKey = 'AIzaSyC4N11SeNXR4oV8zNmPr7t5AzAoaTOWXzY';
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?&location=$lat,$lng&radius=$radius&key=$myKey&type=gym';
    Dio? dio = Dio();
    try {
      Response response = await dio.get(url);
      placesModel = PlacesModel.fromJson(response.data);
    } on DioError catch (error) {
      print('Error: ${error.message}');
    }
    notifyListeners();
    return placesModel;
  }


}
