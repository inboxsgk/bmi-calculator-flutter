import 'dart:math';

import 'package:flutter/material.dart';
import 'Components/constants.dart';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);

  final int height;
  final int weight;

  double _BMI;

  String CalculateBMI() {
    _BMI = weight / pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI > 25) {
      return 'Overweight';
    } else if (_BMI > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_BMI > 25) {
      return 'You have higher than normal body weight.\nTry to exercise more.';
    } else if (_BMI > 18.5) {
      return 'You have normal body weight.\nGood job!';
    }
    else {
      return 'Your body weight is lower than normal.\nEat more!';
    }
  }

  }