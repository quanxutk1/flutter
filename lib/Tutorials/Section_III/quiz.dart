import 'package:flutter/material.dart';
import 'package:my_app/Tutorials/Section_III/question_screen.dart';
import 'package:my_app/Tutorials/Section_III/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
// // Cach 1 su dung qua InitState
//   Widget? activeScreen;
//   @override
//   void initState() {
//     activeScreen =
//         StartScreen(Colors.deepPurple, Colors.deepOrange, switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionScreen();
//     });
//   }

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
      screenWiget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWiget,
      ),
    );
  }
}
