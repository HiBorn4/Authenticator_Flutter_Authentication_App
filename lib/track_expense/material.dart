import 'package:flutter/material.dart';

import 'home.dart';

class MyMaterialWidget extends StatelessWidget {
  const MyMaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenditures',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        // configure the text theme for the app
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              labelLarge: const TextStyle(
                color: Colors.white,
              ),
            ),
        // configure the app bar theme
        appBarTheme: AppBarTheme(
          // configure the app bar title text style
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                titleMedium: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
              .titleLarge,
          // configure the app bar toolbar text style
          toolbarTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                titleMedium: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
              .bodyMedium,
        ),
        // configure the color scheme for the app
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
          secondary: Colors.amber,
        ),
      ),
      // set the home page to be MyHomePage widget
      home: MyHomePage(),
    );
  }
}
