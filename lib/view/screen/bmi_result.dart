import 'package:bmi_calculator/providers/body_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiResult extends StatelessWidget {
  static const routeName='BmiResult';
  const BmiResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('BMI Calculator'),

      ),
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Your BMI Result',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(60),
              child: Column(
                children: [
                  Text(
                    Provider.of<BodyProvider>(context).result,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                  Text(Provider.of<BodyProvider>(context).bmi!.toStringAsFixed(1),
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF111328),
              ),
            ),
            //--------------
            SizedBox(height: 20,),
            Text('Calories Needed',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(60),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("${Provider.of<BodyProvider>(context).bmr!.round().toString()}cal/day",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF111328),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
