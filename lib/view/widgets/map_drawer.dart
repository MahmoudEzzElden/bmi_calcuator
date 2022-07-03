// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screen/stores_locations.dart';

class MapDrawer extends StatelessWidget {
  const MapDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.map),
            title: Text(
              'Nearby Gyms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, StoresLocations.routeName);
            },
          )
        ],
      ),
    );
  }
}
