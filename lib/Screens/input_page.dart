import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/reusable_card.dart';
import '../Components/icon_content.dart';
import '../Components/constants.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';

import 'package:bmi_calculator/calculator_brain.dart';

import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender currentGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      currentGender = Gender.male;
                    });
                  },
                  colour: currentGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    contentText: 'MALE',
                    contentIcon: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      currentGender = Gender.female;
                    });
                  },
                  colour: currentGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    contentText: 'FEMALE',
                    contentIcon: FontAwesomeIcons.venus,
                  ),
                )),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kTextLabelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(kSlidervalue.toString(), style: kNumberStyle),
                        Text(
                          'CM',
                          style: kTextLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: kSlidervalue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: kInactivecolor,
                        onChanged: (double newVal) {
                          setState(() {
                            kSlidervalue = newVal.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextLabelStyle,
                      ),
                      Text(kWeight.toString(), style: kNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          whenpressed: (){
                            setState(() {
                              kWeight--;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          whenpressed: (){
                            setState(() {
                              kWeight++;
                            });
                          },)
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTextLabelStyle,
                          ),
                          Text(kAge.toString(), style: kNumberStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                whenpressed: (){
                                  setState(() {
                                    kAge--;
                                  });
                                },),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                whenpressed: (){
                                  setState(() {
                                    kAge++;
                                  });
                                },)
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            )),
            BottomButton(ButtonText: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(kSlidervalue, kWeight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                BMIResult: calc.CalculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);

            })
          ],
        ));
  }
}


