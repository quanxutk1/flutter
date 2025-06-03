import 'package:flutter/material.dart';
import 'package:my_app/finished/Section%20I/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
