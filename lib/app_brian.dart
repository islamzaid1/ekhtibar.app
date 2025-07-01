import 'questions.dart';
import 'package:flutter/material.dart';

class AppBrian {
  int _num = 0;

  Widget _fixedImage(String path) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Image.asset(
        path,
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }

  final List<Questions> _questionGroup = [];

  AppBrian() {
    _questionGroup.addAll([
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-1.jpg'),
        choices: ['15', '0.15', '100', 'ERROR'],
        correctAnswerIndex: 0,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-2.jpg'),
        choices: ['16 11', '14 9', '15 10', '10 14'],
        correctAnswerIndex: 2,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-3.jpg'),
        choices: ['16 11 9', '15 0 10', 'ERROR', '10 11 12'],
        correctAnswerIndex: 0,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-4.jpg'),
        choices: ['90 30 6 NO', '45 5 1 YES', '180 60 12 NO', 'ERROR'],
        correctAnswerIndex: 1,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-5.jpg'),
        choices: ['7 3', '10 0', 'ERROR', '3 7'],
        correctAnswerIndex: 3,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-6.jpg'),
        choices: ['90 30 6 NO', '45 5 1 YES', '180 60 12 NO', 'ERROR'],
        correctAnswerIndex: 1,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-7.jpg'),
        choices: ['231 62', '132 26', '62 231', 'ERROR'],
        correctAnswerIndex: 2,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-8.jpg'),
        choices: ['ERROR', '3 4 8 1', '1 8 4 3', '10 15 20 25'],
        correctAnswerIndex: 2,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-9.jpg'),
        choices: ['ERROR', '1 6 7 6 1 7', '2 7 8 7 2 8', '10 20 30'],
        correctAnswerIndex: 2,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-10.jpg'),
        choices: ['ERROR', '97', '65', '32'],
        correctAnswerIndex: 2,
      ),

      // New Questions
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-11.jpg'),
        choices: ['10', '20', '&x', '0'],
        correctAnswerIndex: 1,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-12.jpg'),
        choices: ['Even', 'Odd', 'True', 'ERROR'],
        correctAnswerIndex: 0,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-13.jpg'),
        choices: ['1 1 1', '1 2 3', '3 2 1', '0 1 2'],
        correctAnswerIndex: 1,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-14.jpg'),
        choices: ['00 01 02 10 11 12', '012012', '00 10 20', '01 02 03 04'],
        correctAnswerIndex: 0,
      ),
      Questions(
        questionText: 'What is the correct output?',
        questionImage: _fixedImage('images/images-15.jpg'),
        choices: ['10', '20', 'x', '*p'],
        correctAnswerIndex: 1,
      ),
    ]);
  }

  void nextQuestions() {
    if (_num < _questionGroup.length - 1) {
      _num++;
    }
  }

  int get num => _num;

  List<Questions> get questionGroup => List.unmodifiable(_questionGroup);

  bool isFinshed() {
    return _num >= _questionGroup.length - 1;
  }

  void reset() {
    _num = 0;
  }
}
