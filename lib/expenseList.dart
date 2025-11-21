import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(ExpenseModel expense) onRemoveExpense;

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (lst, index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            background: Container(
              color: const Color.fromARGB(111, 255, 82, 82),
              margin: EdgeInsets.only(right: 16, left: 16),
            ),

            child: ExpenseItem(expenses[index]),
          ),
    );
  }
}
