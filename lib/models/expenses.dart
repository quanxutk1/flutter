import 'package:flutter/material.dart';
import 'package:my_app/class/expense.dart';
import 'package:my_app/widgets/expense_list/expenses_list.dart';
import 'package:my_app/widgets/new_expense.dart';

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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final _expenseIndex = _registerExpense.indexOf(expense);

    setState(() {
      _registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpense.insert(_expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget maimContent = Center(
      child: Text('No expense to show'),
    );
    if (_registerExpense.isNotEmpty) {
      maimContent = ExpensesList(
        expenses: _registerExpense,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          // Add toolbar => Row()
          const Text('The chart'),
          Expanded(child: maimContent),
        ],
      ),
    );
  }
}
