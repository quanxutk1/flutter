import 'package:flutter/material.dart';
import 'gradient_container.dart';

//import 'book.dart';

// void main_test(List<String> args) {
//   // String name = 'Nguyen Trung Quan';
//   // print(name);

//   // Map<String, String> objects = {'username': 'quanxutk1', 'password': '123'};
//   // print(objects['username']);

//   var myBook = Book('Sach hoc tap', 2024);
//   print(myBook.getName);

//   myBook.setName = 'Sach khoa hoc';
//   print(myBook.getName);

//   print(Book.age);

//   var bookFunny = BookFunny('Tho va rua', 2025);
//   bookFunny.type = 'Funny';
//   print(bookFunny.type);
//   bookFunny.showHello();
// }

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GridientContainer(Colors.deepOrange, Colors.lightBlue),
    ),
  ));
}
