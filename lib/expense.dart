import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/expenseList.dart';
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
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: Text('Expense Tracker'),
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
          // Text('Expense chart'),
          Expanded(child: Expenselist(expenses: _registeredExpenseList)),
        ],
      ),
    );
  }
}
