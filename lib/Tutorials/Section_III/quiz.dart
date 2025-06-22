import 'package:flutter/material.dart';
import 'package:my_app/Tutorials/Section_III/question_screen.dart';
import 'package:my_app/Tutorials/Section_III/result_screen.dart';
import 'package:my_app/Tutorials/Section_III/start_screen.dart';
import 'package:my_app/finished/Section%20II/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    // Khi la cau hoi cuoi cung thi ve man hinh khoi dong
    if (selectedAnswer.length == questions.length) {
      selectedAnswer.clear();
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

// Cach 2 su dung qua bieu thuc 3 ngoi
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWiget =
        StartScreen(Colors.deepPurple, Colors.deepOrange, switchScreen);

    if (activeScreen == 'question-screen') {
      screenWiget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    switch (activeScreen) {
      case 'question-screen':
        screenWiget = QuestionScreen(
          onSelectAnswer: chooseAnswer,
        );
        break;
      case 'result-screen':
        screenWiget = ResultScreen();
        break;
      default:
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWiget,
      ),
    );
  }
}
