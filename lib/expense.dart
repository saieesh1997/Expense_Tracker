import 'dart:ffi';

import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/expenseList.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/create_new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseModel> _registeredExpenseList = [
    ExpenseModel(
      amount: 20.0,
      title: 'Flutter Course',
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      amount: 20.0,
      title: 'Burger',
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseModel(
      amount: 200.0,
      title: 'Goa Tour',
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _onPressedBottomSheet() {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenseList.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenseList.indexOf(expense);
    setState(() {
      _registeredExpenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Deleted'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenseList.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(
      child: Text("No Expenses Found, Add some By Clicking on + button!"),
    );
    if (_registeredExpenseList.isNotEmpty) {
      maincontent = Expenselist(
        expenses: _registeredExpenseList,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 5, 89),
        title: Text(
          'Expense Tracker',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _onPressedBottomSheet();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 200, child: Chart(expenses: _registeredExpenseList)),
          Expanded(child: maincontent),
        ],
      ),
    );
  }
}
