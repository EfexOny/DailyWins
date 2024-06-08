import 'package:flutter/material.dart';
import 'package:tracker/screens/main_screen.dart';

void  main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( 
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

