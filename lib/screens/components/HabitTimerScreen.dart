import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitTimerScreen extends StatefulWidget {
  final String name;
  final Days;
  final int minutes;
  final String status;
  const HabitTimerScreen(
      {super.key,
      required this.status,
      required this.name,
      required this.minutes,
      required this.Days});

  @override
  State<HabitTimerScreen> createState() => _HabitPoweredScreenState();
}

bool started = false;

class _HabitPoweredScreenState extends State<HabitTimerScreen> {
  late int minutesLeft = widget.minutes;
  late List Days = widget.Days;

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutesLeft > 0) {
        setState(() {
          minutesLeft--;
        });
      } else {
        setState(() {
          started = false;
        });
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
                Text(
                  minutesLeft.toString(),
                  style: GoogleFonts.montserrat(fontSize: 40),
                ),
                Spacer(),
                GFButton(
                  fullWidthButton: true,
                  onPressed: () {
                    if (minutesLeft > 0) {
                      setState(() {
                        started = true;
                        _startTimer();
                      });
                    } else {
                      // Days.clear;
                      setState(() {
                        Days.add(DateTime.now().day);
                        started = false;
                      });
                    }
                  },
                  child: Text(
                      !started
                          ? "Start"
                          : minutesLeft <= 0
                              ? "Done"
                              : "Counting...",
                      style: GoogleFonts.montserrat(fontSize: 25)),
                  color: started
                      ? Colors.blue
                      : minutesLeft == 0
                          ? Colors.green
                          : Colors.black,
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

bool checkDay(List zile) {
  if (zile.contains(DateTime.now().day))
    return true;
  else
    return false;
}
