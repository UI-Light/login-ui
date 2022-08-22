import 'package:flutter/material.dart';
import 'package:practice_state/ui/signin_view.dart';

//The main method is where the program starts executing from
void main() {
  runApp(
    const MaterialApp(
      home: SignInView(), //The material app has a home property and this points
    ), //to the first screen in the app
  );
}
