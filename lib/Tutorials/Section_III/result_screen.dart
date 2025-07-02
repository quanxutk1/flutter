import 'package:flutter/material.dart';
import 'package:my_app/Tutorials/Section_III/question_summary.dart';
import 'package:my_app/finished/Section%20II/data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSumaryData() {
    List<Map<String, Object>> sumary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      sumary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return sumary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered 4 of 5 question'),
            SizedBox(
              height: 30,
            ),
            QuestionSummary(getSumaryData()),
            // const Text('List of answer of question'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
