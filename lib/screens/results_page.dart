import 'package:bmi/constants.dart';
import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomButton.dart';
import '../widgets/reusablecard.dart';

class ResultsPage extends StatelessWidget {
  String resultText,bmiResult,interpretation;
  ResultsPage({required this.resultText, required this.bmiResult, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
          Expanded(
          child: Container(
              padding: EdgeInsets.all(devW*0.01),
          alignment: Alignment.bottomLeft,
          child: Center(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
        ),
    ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                  resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                   interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ), onpress: (){},
            ),
            ),
                BottomButton(
                  buttonTitle: 'RE-CALCULATE',
                  onTap: () {
                    Navigator.pop(context);
                  },
                )

    ])
    )
    );
  }
}
