import 'package:flutter/material.dart';
import 'package:my_app/data/question.dart';
import 'package:my_app/question_screen.dart';
import 'package:my_app/results_screen.dart';

import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// // Cach 1 su dung init state
// class _QuizState extends State<Quiz> {
//   Widget? activeScreen;
//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.deepPurple, Colors.lightBlue],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight),
//           ),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }

// Cach 2 su dung init state
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      // Process the answers and display the result screen
      setState(() {
        selectedAnswers = [];
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswers,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
