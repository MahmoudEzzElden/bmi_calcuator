import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier{
String? gender;
clickOnMale(){
  gender='male';
  notifyListeners();
}
clickOnFemale(){
  gender='female';
  notifyListeners();
}
}