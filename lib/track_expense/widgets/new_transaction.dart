import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// The code defines a NewTransaction widget that extends StatefulWidget.
// It takes in a function newTx as a required argument, and optionally a key.
// It also overrides the createState method to return an instance of _NewTransactionState.
class NewTransaction extends StatefulWidget {
  final Function newTx;
  const NewTransaction(
    this.newTx,
  );

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

// The code defines the _NewTransactionState class, which extends State<NewTransaction>.
// It contains a titleController and an amountController to handle text input,
// as well as a _selectedDate variable that holds the currently selected date.
// The _submitData method validates the input fields and calls the newTx function with the
// entered data before closing the current widget.
// The _presentDatePicker method shows a date picker and sets the _selectedDate variable to the picked
// date if one is chosen.
// It also prints a debug message if kDebugMode is true.
class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // ignore: unnecessary_null_comparison
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.newTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) =>
        pickedDate == null ? null : setState(() => _selectedDate = pickedDate));
    if (kDebugMode) {
      print('...');
    }
  }

  // This is a method override for the build() method which returns a widget and
  // takes a BuildContext as an argument.
  @override
  Widget build(BuildContext context) {
    // A SingleChildScrollView is a widget that enables vertical scrolling when
    // its child widget exceeds the height of its viewport.
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          // This sets the padding of the content inside the Card widget.
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // This creates a text input field for the user to enter a title for their transaction.
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitData(),
              ),
              // This creates a text input field for the user to enter an amount for their transaction.
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              // This creates a button that allows the user to choose a date for their transaction.
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          // This displays the date that the user has chosen for their transaction.
                          // ignore: unnecessary_null_comparison
                          _selectedDate == null
                              ? 'No Date Choosen !'
                              : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // This opens a date picker dialog box for the user to choose a date.
                        _presentDatePicker();
                      },
                      child: Text(
                        ("Choose Date"),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // This creates a button that allows the user to submit their transaction.
              ElevatedButton(
                onPressed: () {
                  _submitData();
                },
                child: const Text(
                  ('Add Transaction'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
