import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.color1, this.color2, this.startQuiz, {super.key});
  final Color color1;
  final Color color2;
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Learn Flutter with the fun anyway!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                iconColor: Colors.white,
              ),
              onPressed: startQuiz,
              label: Text(
                'Start quiz!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
