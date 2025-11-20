import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (lst, index) => ExpenseItem(expenses[index]),
    );
  }
}
