import 'package:flutter/material.dart';
import 'package:my_app/models/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 118));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ))),
      home: Expenses(),
    ),
  );
}
