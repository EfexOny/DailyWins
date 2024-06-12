import 'package:flutter/material.dart';
import 'package:tracker/data/ProgressItem.dart';

class HabitCard extends StatelessWidget {
  final String name;
  final String type;
  final String freq;
  final String status;
  final int amount;

  const HabitCard(
      {required this.name,
      required this.type,
      required this.freq,
      required this.status,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Color(0xFFf8f4e4), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.data_array_sharp),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 17),
                ),
                statusSelect(status)
              ],
            ),
            const Spacer(),
            Container(
              width: 2,
              height: 50,
              color: Color.fromARGB(97, 75, 75, 75),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [typeSelect(type), Text(amount.toString())],
            )
          ],
        ),
      ),
    );
  }
}

Widget typeSelect(String type) {
  if (type == "minutes")
    return Icon(Icons.access_time_filled_outlined);
  else
    return Icon(Icons.timeline_sharp);
}

Widget statusSelect(String status) {
  if (status == "skipped")
    return Text(
      "Skip",
      style: TextStyle(color: Colors.blue, fontSize: 12),
    );
  else if (status == "done")
    return Text(
      "Done",
      style: TextStyle(color: Colors.green, fontSize: 12),
    );
  else
    return Text(
      "NEW",
      style: TextStyle(color: Color(0xFFda2aa8), fontSize: 12),
    );
}
