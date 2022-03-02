import 'package:flutter/material.dart';
import 'constants.dart';



class BottomButton extends StatelessWidget {

  BottomButton({@required this.ButtonText, @required this.onTap});

  final String ButtonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
        child: Center(child: Text(ButtonText, style: kLargeButtonTextstyle)),
        //Left top right bottom
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    );
  }
}