import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';

class HabitCard extends StatelessWidget {

  final ProgressItem item;
  const HabitCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(width: 20,),
              Icon(item.icon),
              SizedBox(width: 20,),
              Text(item.title)
            ],),
            SizedBox(width: 40,),
            Text("NEW")
          ],
        ),
      ),
    );
  }
}