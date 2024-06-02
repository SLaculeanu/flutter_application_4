import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/expense.dart';
import 'package:flutter_application_4/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]), 
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),  
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index])
      ),
    );
  }
  
}