// Importing the necessary packages flutter/material.dart and intl.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Importing Transaction class from the transaction.dart file.
import '../models/transaction.dart';

// Creating a new class TransactionList that extends StatelessWidget.
class TransactionList extends StatelessWidget {
  // Declaring two final variables transactions and deleteTx and accepting them as parameters in the
  // constructor.
  final List<Transaction> transactions;
  final Function deleteTx;

  // Constructor that receives the transactions and deleteTx function
  const TransactionList(
    this.transactions,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    // A SizedBox with a height of 300 containing either a message or the transactions list
    return SizedBox(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    // Text widget with a message when there are no transactions
                    Text(
                      'No transactions Added Yet!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Placeholder image when there are no transactions
                    SizedBox(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          // A ListView.builder that generates a Card for each transaction
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // Card with the transaction information
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        // Text widget that shows the transaction amount
                        child: FittedBox(
                          child: Text('₹${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      // Text widget that shows the transaction title
                      transactions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      // Text widget that shows the transaction date
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 430
                        ? TextButton.icon(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            label: const Text('Delete'),
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteTx(transactions[index].id),
                          )
                        : IconButton(
                            // Icon button to delete the transaction
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ),
                );
              },
              // Number of transactions
              itemCount: transactions.length,
            ),
    );
  }
}
