import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier{
  int height=180;
  int weight=80;
  int age=24;
  changeHeight(double value){
    height=value.round();
    notifyListeners();
  }
  weightMinus(){
    weight--;
    notifyListeners();
  }
  weightPlus(){
    weight++;
    notifyListeners();
  }
  ageMinus(){
    age--;
    notifyListeners();
  }
  agePlus(){
    age++;
    notifyListeners();
  }
}