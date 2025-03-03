import 'package:flutter/material.dart';
import 'package:my_app/class/expense.dart';
import 'package:my_app/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 99.99,
      date: DateTime(1999, 11, 12),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 100,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registerExpense)),
        ],
      ),
    );
  }
}
