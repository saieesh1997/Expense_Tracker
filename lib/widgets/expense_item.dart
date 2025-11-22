import 'package:expense_tracker/Models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(expense.title),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      SizedBox(width: 6),
                      Text(expense.formattedDate),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
