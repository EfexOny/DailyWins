import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitPoweredScreen extends StatefulWidget {
  final String name;
  final Days;
  final int minutes;
  const HabitPoweredScreen(
      {super.key,
      required this.name,
      required this.minutes,
      required this.Days});

  @override
  State<HabitPoweredScreen> createState() => _HabitPoweredScreenState();
}

class _HabitPoweredScreenState extends State<HabitPoweredScreen> {
  late int minutesLeft = widget.minutes;
  late List Days = widget.Days;

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutesLeft > 0) {
        setState(() {
          minutesLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfcfcec),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                    Center(
                        child: Text(
                      widget.name,
                      style: GoogleFonts.montserrat(fontSize: 20),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TableCalendar(
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) =>
                        _customDayBuilder(context, day),
                  ),
                  calendarFormat: _calendarFormat,
                  headerVisible: false,
                  pageAnimationCurve: Curves.bounceIn,
                  headerStyle: HeaderStyle(titleCentered: true),
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2024, 6, 10),
                  lastDay: DateTime.utc(2024, 6, 20),
                ),
                SizedBox(
                  height: 300,
                ),
                Text(minutesLeft.toString()),
                GFButton(
                  onPressed: () {
                    if (minutesLeft > 0) {
                      
                      setState(() {
                        _startTimer();
                      });
                    } else {
                      // Days.clear;
                      setState(() {
                      Days.add(DateTime.now().day);
                      });
                    }
                  },
                  child: Text(minutesLeft == 0 ? "Done" : "Start"),
                  shape: GFButtonShape.pills,
                )
              ],
            ),
          ),
        ));
  }

  Widget _customDayBuilder(context, day) {
    // TO DO: take the days array of the hive box of the habits

    final isDays = Days.contains(day.day);

    final color = isDays ? Colors.green : Colors.grey;

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color));
  }
}
