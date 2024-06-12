import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/screens/main/introductory.dart';
import 'package:tracker/screens/main/main_screen.dart';

class ConditionalScreen extends StatefulWidget {
  const ConditionalScreen({super.key});

  @override
  State<ConditionalScreen> createState() => _ConditionalScreenState();
}



class _ConditionalScreenState extends State<ConditionalScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StatefulWidget>(
      future: CheckName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

Future<StatefulWidget> CheckName() async {

  var users = await Hive.openBox("users");


  if(users.isEmpty)
    return IntroductoryPage();
  else
    return MainPage();

    
    
}