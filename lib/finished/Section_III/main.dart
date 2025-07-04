import 'package:flutter/material.dart';
import 'package:my_app/finished/Section_III/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 118),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main() {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); // Phai co moi lock man hinh ko thi run error
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {});
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,
      ),
      theme: ThemeData().copyWith(
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
              )),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondary,
                fontSize: 14,
              ))),
      home: Expenses(),
    ),
  );
}
