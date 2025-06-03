import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random(); // Cach nay toi uu bo nho cho ung dung

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDice = 2;
  void rollDice() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-$currentDice.png"),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Roll Dice',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}
