import 'package:bmi_calculator/providers/data_provider.dart';
import 'package:bmi_calculator/providers/gender_provider.dart';
import 'package:bmi_calculator/view/screen/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/body_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Provider.of<GenderProvider>(context, listen: false)
                        .clickOnMale();
                  },
                  child:Container(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Icon(
                          IconData(0xe3c5, fontFamily: 'MaterialIcons'),
                          size: 80,
                          color: Colors.white,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Provider.of<GenderProvider>(context).gender == 'male'
                          ? Color(0xFF3F51B5)
                          : Color(0xFF111328),
                    ),
                  )
              ),
              GestureDetector(
                  onTap: () {

                    Provider.of<GenderProvider>(context, listen: false)
                        .clickOnFemale();
                  },
                  child:Container(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Icon(
                          IconData(0xe261, fontFamily: 'MaterialIcons'),
                          size: 80,
                          color: Colors.white,
                        ),
                        Text('Female'
                          ,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Provider.of<GenderProvider>(context).gender == 'female'
                          ? Colors.indigo
                          : Color(0xFF111328),
                    ),
                  )
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'Height',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      Provider.of<DataProvider>(context).height.toString(),
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    onChanged: (double value) {
                      Provider.of<DataProvider>(context, listen: false)
                          .changeHeight(value);
                    },
                    value: Provider.of<DataProvider>(context).height.toDouble(),
                    min: 120,
                    max: 220,
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF111328),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Provider.of<DataProvider>(context).weight.toString(),
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          elevation: 0.0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .weightMinus();
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xFF4C4F5E),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RawMaterialButton(
                          elevation: 0.0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .weightPlus();
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xFF4C4F5E),
                        )
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF111328),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Provider.of<DataProvider>(context).age.toString(),
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          elevation: 0.0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .ageMinus();
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xFF4C4F5E),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RawMaterialButton(
                          elevation: 0.0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .agePlus();
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xFF4C4F5E),
                        ),
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF111328),
                ),
              ),

              //here
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15, left: 100, right: 100),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF111328),
            ),
            child: TextButton(
              onPressed: () {
                if( Provider.of<GenderProvider>(context, listen: false).gender==null){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Gender Empty'),
                          content: Text('Please select gender'),
                        );
                      });
                } else{
                  Provider.of<BodyProvider>(context, listen: false)
                      .bmiCalcuate(
                      Provider.of<DataProvider>(context, listen: false)
                          .height,
                      Provider.of<DataProvider>(context, listen: false)
                          .weight);
                  Provider.of<BodyProvider>(context, listen: false)
                      .bmrCalculation(
                      Provider.of<DataProvider>(context, listen: false)
                          .height
                          .toDouble(),
                      Provider.of<DataProvider>(context, listen: false)
                          .weight
                          .toDouble(),
                      Provider.of<DataProvider>(context, listen: false).age,
                      Provider.of<GenderProvider>(context, listen: false)
                          .gender! );
                  Navigator.pushNamed(context, BmiResult.routeName);
                }
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
