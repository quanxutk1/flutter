import "package:flutter/material.dart";
import "package:my_app/Tutorials/Section_II/gradient_container.dart";

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(Colors.deepPurple, Colors.deepPurple),
      ),
    ),
  );
}
