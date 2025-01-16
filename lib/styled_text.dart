import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String
      text; // final dung khi sau khi xac dinh duoc gia tri thi ko thay doi giong const
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 28,
      ),
    );
  }
}
