// Importing the required packages and files
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

// Defining a chart widget that extends StatelessWidget
class Chart extends StatelessWidget {
  const Chart(
    this.recentTransactions,
  );

  // Initializing a final list of recent transactions to be displayed in the chart
  final List<Transaction> recentTransactions;

  // Function to group the transaction values by day
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index + 1));
      double totalSum = 0.00;

      // Looping through the recent transactions to find the sum of amounts for each day
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // Returning the day and the total amount for that day
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'Amount': totalSum
      };
      // Reversing the list to display it in chronological order
    }).reversed.toList();
  }

  // Function to calculate the total spending for the week
  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (double sum, item) => sum + (item['Amount'] as double));
  }

  // Building the chart widget
  @override
  Widget build(BuildContext context) {
    return Card(
      // Setting the elevation of the chart card
      elevation: 6,
      // Setting the margin of the chart card
      margin: const EdgeInsets.all(20),
      child: Container(
        // Setting the padding of the chart container
        padding: const EdgeInsets.all(10),
        child: Row(
          // Setting the space around each chart bar
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // Mapping the data for each chart bar
          children: groupedTransactionValues.map((data) {
            return Flexible(
              // Ensuring the chart bar fits the available space
              fit: FlexFit.tight,
              child: ChartBar(
                  // Displaying the day of the week
                  (data['Day'].toString()),
                  // Displaying the amount spent for that day
                  (data['Amount'] as double),
                  // Calculating and displaying the percentage of spending for that day
                  totalSpending == 0.0
                      ? 0.0
                      : (data['Amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
