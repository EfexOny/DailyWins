import 'package:flutter/material.dart';

class HabitPoweredScreen extends StatefulWidget {
final String name;
final Days;
  const HabitPoweredScreen({super.key,required this.name, required this.Days});

  @override
  State<HabitPoweredScreen> createState() => _HabitPoweredScreenState();
}



class _HabitPoweredScreenState extends State<HabitPoweredScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
          ],
        ) ,
      ),
    );
  }   

}
