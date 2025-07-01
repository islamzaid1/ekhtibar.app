import 'package:flutter/material.dart';

class Questions {
  final String _questionText;
  final Widget _questionImage;
  final List<String> _choices;
  final int _correctAnswerIndex;

  Questions({
    required String questionText,
    required Widget questionImage,
    required List<String> choices,
    required int correctAnswerIndex,
  }) : _questionText = questionText,
       _questionImage = questionImage,
       _choices = choices,
       _correctAnswerIndex = correctAnswerIndex;

  String get questionText => _questionText;
  Widget get questionImage => _questionImage;
  List<String> get choices => _choices;
  int get correctAnswerIndex => _correctAnswerIndex;
}
