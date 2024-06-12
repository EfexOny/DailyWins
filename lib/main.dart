import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/screens/others/conditional_screen.dart';
import 'package:tracker/screens/data/user.dart';
import 'package:tracker/screens/main/main_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  var users = await Hive.openBox("users");
  
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
      home: const ConditionalScreen(),
    );
  }
}
