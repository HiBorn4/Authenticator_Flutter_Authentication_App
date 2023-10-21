// Import the flutter material library
import 'package:flutter/material.dart';
// Import the Transaction model from transaction.dart file
import '../models/transaction.dart';
// Import the NewTransaction class from new_transaction.dart file
import './new_transaction.dart';

// Create a stateful widget named UserTransactions
class UserTransactions extends StatefulWidget {
  // Create constructor for UserTransactions widget
  const UserTransactions();

  // Create a State object for UserTransactions widget
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

// Create a state object named _UserTransactionsState for UserTransactions widget
class _UserTransactionsState extends State<UserTransactions> {
  // Create a list of transactions to store user's transaction history
  final List<Transaction> _userTransaction = [];

  // A method to add new transaction to the list
  void _addNewTransaction(String txTitle, double txAmount) {
    // Create a new Transaction object with given title, amount, and date
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    // Update the state of UserTransactions widget by adding new transaction to the list
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  // A method to build the UserTransactions widget
  @override
  Widget build(BuildContext context) {
    // Return a column widget that contains NewTransaction widget
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
      ],
    );
  }
}
