// Imports the Material UI package from Flutter, which is necessary for creating UI components.
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// Defines a new class called ChartBar, which is a stateless widget.
class ChartBar extends StatelessWidget {
  // Declares three final variables - label, spendingAmount and spendingPctOfTotal - which represent
  // the label for the bar, the amount of money spent, and the percentage of total spending, respectively.
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  // Constructor for the ChartBar class that accepts three named arguments - label, spendingAmount,
  // and spendingPctOfTotal - and an optional key.
  const ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal,
  );

  // Overrides the build method from the superclass (StatelessWidget) to create the widget tree.
  @override
  Widget build(BuildContext context) {
    // Returns a Column widget which will have a child list of widgets.
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          // Creates a SizedBox with height of 20 that contains a FittedBox, which in turn contains a
          // Text widget. The text widget displays the spendingAmount in a dollar format using the
          // toStringAsFixed method to display no decimal places.
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('₹${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          // Creates a SizedBox with a constant height of 4.
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          // Creates another SizedBox widget, but with a height of 60 and a width of 10. It contains a
          // Stack widget, which will allow the two containers to be overlaid.
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                // Creates a Container widget that will be used to display a grey border around the
                // chart bar. The container has a border, color and borderRadius property.
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Creates another Container widget that will be used to display the actual spending bar.
                // The heightFactor property of the FractionallySizedBox widget is set to the
                // spendingPctOfTotal value, which determines the height of the bar. The container
                // also has a background color and borderRadius property.
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
