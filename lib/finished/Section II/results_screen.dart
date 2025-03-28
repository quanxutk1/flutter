import "package:flutter/material.dart";
import "package:my_app/finished/Section%20II/data/question.dart";
import 'questions_sumary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });
  final void Function() onRestart;
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
    final sumaryData = getSumarryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = sumaryData.where((data) {
      return data['user_answer'] == data['corect_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You  answers $numCorrectAnswers correct of $numTotalQuestions question ...'),
            QuestionsSumary(sumaryData),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: onRestart, child: Text('Restart quiz')),
          ],
        ),
      ),
    );
  }
}
