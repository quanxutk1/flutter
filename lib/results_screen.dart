import "package:flutter/material.dart";
import "package:my_app/data/question.dart";
import 'questions_sumary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
  });
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSumarryData() {
    final List<Map<String, Object>> sumary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      sumary.add({
        'question_index': i,
        'question': questions[i].text,
        'corect_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return sumary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionsSumary(getSumarryData()),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answers and question ...'),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: Text('Restart quiz')),
          ],
        ),
      ),
    );
  }
}
