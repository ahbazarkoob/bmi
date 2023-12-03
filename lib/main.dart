import 'package:bmi/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

var devW, devH;

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    devW=MediaQuery.of(context).size.width;
    devH=MediaQuery.of(context).size.height;
    return MaterialApp(
      theme:  ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF0A0E21)),
        sliderTheme: SliderThemeData(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xff8d8e98),
            thumbColor: Color(0xffeb1555),
            overlayColor: Color(0x29eb1555),
            thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0
            ),
            overlayShape: RoundSliderOverlayShape(
                overlayRadius: 20.0
            )
        ),),
      home: InputPage(),
    );
  }
}

