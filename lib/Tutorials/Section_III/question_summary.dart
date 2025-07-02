import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data["question_idex"] as int) + 1).toString()),
            Column(
              children: [
                Text(
                  data["question"] as String,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data["correct_answer"] as String,
                ),
                Text(
                  data["user_answer"] as String,
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
