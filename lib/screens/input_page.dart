import 'package:bmi/calculateBmi.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import '../main.dart';
import '../widgets/genderCard.dart';
import '../widgets/reusablecard.dart';

var devW, devH;

enum Gender{male, female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age= 12;

  @override
  Widget build(BuildContext context) {
    devW = MediaQuery
        .of(context)
        .size
        .width;
    devH = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('BMI CALCULATOR')
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: genderCard(
                      icon: FontAwesomeIcons.mars, label: 'MALE'),
                ),
                ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: genderCard(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                ),
              ],
            ),
            ReusableCard(
              onpress: () {},
              colour: activeCardColor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: klabelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberStyle,),
                    Text('cm', style: klabelStyle,)
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  min: 120.0,
                  max: 220.0,
                  label: 'val',
                )
              ],
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReusableCard(
                  onpress: () {
                  },
                  colour: activeCardColor, cardChild: DetailCard(label: 'WEIGHT',variable: weight,)),
                ReusableCard(
                  onpress: () {},
                  colour: activeCardColor, cardChild: DetailCard(label: 'AGE',variable: age),),
              ],
            ),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ResultsPage(resultText: calc.calculateBMI() ,bmiResult: calc.getResult(),interpretation: calc.getInterpretation(),)));
              },
              child: Container(
                child: Center(child: Text('Calculate',style: kLargeButtonTextStyle)),
                margin: EdgeInsets.only(top: 10),
                color: bottomContainerColor,
                height: devH * 0.1,
              ),
            )
          ],
        )
    );
  }
}

class DetailCard extends StatefulWidget {
  String label;
  int variable;
  DetailCard({required this.label, required this.variable});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(widget.label, style: klabelStyle,),
        Text(widget.variable.toString(), style: kNumberStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton.outlined(
              icon: Icon(Icons.add),
              onPressed: (){
                setState(() {
                  widget.variable++;
                });
              },
              style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(
                    Colors.white
                ),
              ),
              color: Colors.grey,
            ),
            IconButton.filled(
              icon: Icon(FontAwesomeIcons.minus),
              onPressed: (){
                setState(() {
                  widget.variable--;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}

