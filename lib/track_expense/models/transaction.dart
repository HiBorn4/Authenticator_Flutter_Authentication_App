// Defining a Transaction class
class Transaction {
  // Declaring variables for the transaction ID, title, amount, and date, all of which are final and
  // required
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  // Defining a constructor for the Transaction class
  Transaction({
    required this.id, // ID of the transaction
    required this.title, // Title or description of the transaction
    required this.amount, // Amount spent or received in the transaction
    required this.date, // Date of the transaction
  });
}