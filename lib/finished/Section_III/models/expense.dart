import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final formater = DateFormat.yMd();

enum Category { travel, food, work, leisure }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.leisure: Icons.movie
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses =
            allExpenses.where((expene) => expene.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (Expense expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
