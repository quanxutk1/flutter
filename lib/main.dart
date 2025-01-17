import "package:flutter/material.dart";
import "start_screen.dart";

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: const StartScreen()),
    ),
  ));
}
