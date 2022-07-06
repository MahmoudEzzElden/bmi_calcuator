// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:bmi_calculator/model/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/location_provider.dart';
import '../../providers/places_provider.dart';

class StoresLocations extends StatefulWidget {
  static const routeName = 'StoresLocations';

  const StoresLocations({Key? key}) : super(key: key);

  @override
  State<StoresLocations> createState() => _StoresLocationsState();
}

class _StoresLocationsState extends State<StoresLocations> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;
   Future<PlacesModel?>? future;


  @override
  void dispose() {
    mapController!.dispose();
    Provider.of<LocationProvider>(context,listen: false).myMarker.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.sync(() => Provider.of<LocationProvider>(context, listen: false)
            .setCurrentLocation())
        .whenComplete(() => future =
            Provider.of<PlaceProvider>(context, listen: false).getPlaces(
                Provider.of<LocationProvider>(context, listen: false)
                    .currentLocation!
                    .latitude,
                Provider.of<LocationProvider>(context, listen: false)
                    .currentLocation!
                    .longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Provider.of<LocationProvider>(context).currentLocation ==
                    null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            Provider.of<LocationProvider>(context)
                                .currentLocation!
                                .latitude,
                            Provider.of<LocationProvider>(context)
                                .currentLocation!
                                .longitude),
                        zoom: 19.0),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                      _controller.complete(controller);
                      Provider.of<LocationProvider>(context, listen: false)
                          .addNewMarker(
                              LatLng(
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .currentLocation!
                                      .latitude,
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .currentLocation!
                                      .longitude),
                              MarkerId('Home'));
                    },
                    markers:
                        Provider.of<LocationProvider>(context, listen: false)
                            .myMarker,
                    //myMarker,
                  ),
          ),
          Expanded(
            child: FutureBuilder<PlacesModel?>(
                future: future,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: placesModel!.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                LatLng newlatlang = LatLng(
                                    placesModel!
                                        .data[index].geometry!.location!.lat!,
                                    placesModel!
                                        .data[index].geometry!.location!.lng!);
                                Provider.of<LocationProvider>(context,
                                        listen: false)
                                    .addNewMarker(
                                        newlatlang,
                                        MarkerId(
                                            placesModel!.data[index].name!));
                                mapController?.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: newlatlang, zoom: 17)

                                        ));
                              },
                              contentPadding: EdgeInsets.all(15),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    placesModel!.data[index].imageIcon!),
                              ),
                              title: placesModel!.data[index].name == null
                                  ? Text('No Name')
                                  : Text(placesModel!.data[index].name!),
                              subtitle: placesModel!.data[index].rate == null
                                  ? Text('No Rating')
                                  : Text('Rate:' +
                                      placesModel!.data[index].rate!
                                          .toString()),
                            );
                          })
                      : snapshot.hasError
                          ? Center(
                              child: Text(snapshot.error.toString()),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                }),
          )
        ],
      ),
    );
  }
}
