import 'package:bmi_calculator/model/location_model.dart';

class Geometry {
  final Location? location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<dynamic, dynamic> json) {
    return Geometry(location: Location.fromJson(json['location']));
  }
}
