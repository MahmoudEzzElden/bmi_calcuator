import 'package:bmi_calculator/model/geometry.dart';

class PlacesModel {
  List<Place> data = [];

  PlacesModel({required this.data});

  PlacesModel.fromJson(Map<String, dynamic> json) {
    data = <Place>[];
    json['results'].forEach((v) {
      data.add(Place.fromJson(v));
    });
  }
}

class Place {
  final Geometry? geometry;
  final String? name;
  final String? imageIcon;
  final num? rate;

  Place({
    this.imageIcon,
    this.rate,
    this.geometry,
    this.name,
  });

  factory Place.fromJson(Map<dynamic, dynamic> json) {
    return Place(
        geometry: Geometry.fromJson(json['geometry']),
        name: json['name'],
        imageIcon: json['icon'],
        rate: json['rating']);
  }
}


