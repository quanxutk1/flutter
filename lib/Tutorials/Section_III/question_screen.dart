import 'package:flutter/material.dart';
import 'package:my_app/Tutorials/Section_III/answer_button.dart';
import 'package:my_app/Tutorials/Section_III/data/questions_data.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var currentQuesiton = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuesiton.text,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuesiton.getShuffleAnswer().map(
              (item) {
                return AnswerButton(answerText: item, onTap: () {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
