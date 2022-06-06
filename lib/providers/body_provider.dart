import 'package:flutter/cupertino.dart';

class BodyProvider with ChangeNotifier {
  double? bmi;
  double? bmr;
  String result = '......';
  bmrCalculation(double height, double weight, int age, String gender) {
    if (gender == 'male') {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else if (gender == 'female') {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;

    }
    notifyListeners();
  }

  bmiCalcuate(height, weight) {
    bmi = weight! / (height/100 * height/100);
    print('weight= $weight---------height=$height');
    print('this is the bmi $bmi');
    if (bmi! < 18.5) {
      result = 'Under Weight';
    } else if (bmi! >= 18.5 && bmi! <= 24.9) {
      result = 'Normal Weight';
    } else if (bmi! > 24.9) {
      result = 'Over Weight';
    }
    notifyListeners();
  }
}
