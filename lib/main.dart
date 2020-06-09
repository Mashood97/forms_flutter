import 'package:flutter/material.dart';
import './screens/form_screen.dart';
void main()=>runApp(
  Settings());


  class Settings extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.amber,
        
        ),
        home: FormScreen(),
      );
    }
  }