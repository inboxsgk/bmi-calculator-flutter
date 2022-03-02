import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';
import '../Components/bottom_button.dart';

import '../Components/constants.dart';

import 'input_page.dart';



class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.BMIResult,@required this.interpretation, @required this.resultText});

  final String BMIResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,

              child: Text(
                "Your Result",
                style: kNumberStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(BMIResult.toString(), style: kBMITextStyle),
                  Text(interpretation.toString(), style: kBMIResultCommentStyle,),
                ],
              ),
            ),
          ),
          BottomButton(ButtonText: 'RE-CALCULATE',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },),
        ],
      ),
    );
  }
}
