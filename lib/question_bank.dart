import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question_structure.dart';

class Question_Bank{
  int _questionNumber = 0;
  List<Widget> scoreIcons = [];
  final List<Question_Structure> _questions = [
    Question_Structure('Dart language is originally developed by Microsoft in 2011', false),
    Question_Structure('Dart is a programming language used for mobile app development', true),
    Question_Structure('The purpose of the "const" keyword is to define a variable that can only be accessed within its scope', false),
    Question_Structure(' To define a variable that cannot be changed after its initial assignment "final" keyword is used', true),
    Question_Structure('To define a function that returns a Future, the "async" keyword is used', true),
    Question_Structure('The "break" keyword in Dart is used to exit a function', false),
    Question_Structure('The "continue" keyword is used to skip a single iteration of a loop', true),
    Question_Structure('"?"operator is used for null-aware access in Dart?', true),
    Question_Structure('Dart has multiple interfaces.', true),
    Question_Structure('--version command is used to display VM version information', true),


  ];

  void nextQuestion(){
    if(_questionNumber < _questions.length){
      _questionNumber++;
    }

  }

  String question(){
    return _questions[_questionNumber].question;
  }

  bool answer(){
    return _questions[_questionNumber].answer;

  }

  bool questionStatus(){
    return _questionNumber  ==  _questions.length;
  }
  void reset(){
    _questionNumber = 0;
    scoreIcons = [];
  }


  }



