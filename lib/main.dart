// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_calculator/providers/body_provider.dart';
import 'package:bmi_calculator/providers/location_provider.dart';
import 'package:bmi_calculator/providers/places_provider.dart';
import 'package:bmi_calculator/view/screen/home_page.dart';
import 'package:bmi_calculator/providers/data_provider.dart';
import 'package:bmi_calculator/providers/gender_provider.dart';
import 'package:bmi_calculator/view/screen/bmi_result.dart';
import 'package:bmi_calculator/view/screen/stores_locations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BodyProvider>(
      create: (context) => BodyProvider(),
    ),
    ChangeNotifierProvider<GenderProvider>(
      create: (context) => GenderProvider(),
    ),
    ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
    ),
    ChangeNotifierProvider<LocationProvider>(
      create: (context) => LocationProvider(),
    ),
    ChangeNotifierProvider<PlaceProvider>(
      create: (context) => PlaceProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
      BmiResult.routeName:(context)=>BmiResult(),
          StoresLocations.routeName:(context)=>StoresLocations(),
    }, home: SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:Color(0xFF111328),
      nextScreen: HomePage(),
      splash: Center(
        child: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.grey, fontSize: 24),
        ),
      ),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
