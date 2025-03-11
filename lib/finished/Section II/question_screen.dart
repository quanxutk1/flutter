import 'package:flutter/material.dart';
import 'package:my_app/finished/Section%20II/data/question.dart';
//import 'package:my_app/models/quiz_question.dart';

// import 'package:google_fonts/google_fonts.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedtAnswer) {
    widget.onSelectAnswer(selectedtAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              // style: GoogleFonts.lato(
              //   color: Colors.white,
              //   fontSize: 24,
              //   fontWeight: FontWeight.bold,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 30,
            ),
            // AnswerButton("Answer 1", () {}),
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
