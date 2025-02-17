import 'package:flutter/material.dart';

class QuestionsSumary extends StatelessWidget {
  const QuestionsSumary(this.sumaryData, {super.key});

  final List<Map<String, Object>> sumaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sumaryData.map((data) {
        return Row(
          children: [
            Text(((data['question_index'] as int) + 1).toString()),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(
                  height: 5,
                ),
                Text(data['user_answer'] as String),
                Text(data['corect_answer'] as String),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
