import 'package:flutter/material.dart';

import 'dice_roller.dart';

//import 'styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GridientContainer extends StatelessWidget {
  const GridientContainer(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    startAlignment = Alignment.topCenter;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment)),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GridientContainer extends StatelessWidget {
//   const GridientContainer(this.color1, this.color2, {super.key});
//   final Color color1;
//   final Color color2;
//   @override
//   Widget build(BuildContext context) {
//     startAlignment = Alignment.topCenter;
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [color1, color2],
//               begin: startAlignment,
//               end: endAlignment)),
//       child: const Center(
//         child: StyledText('I am king'),
//       ),
//     );
//   }
// }

// class GridientContainer extends StatelessWidget {
//   const GridientContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     startAlignment = Alignment.topCenter;
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.deepOrange, Colors.lightBlue],
//               begin: startAlignment,
//               end: endAlignment)),
//       child: const Center(
//         child: StyledText('I am king'),
//       ),
//     );
//   }
// }
