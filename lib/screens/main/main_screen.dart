import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/screens/others/habit_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum freq { daily, weekly }

freq _selectedfreq = freq.daily;

enum action { times, minutes }

action _selectedType = action.times;

final _nume = TextEditingController();

class _MainPageState extends State<MainPage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      print(i);
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    CalendarFormat _calendarFormat = CalendarFormat.week;
    List<ProgressItem> progressItems = [
      ProgressItem(
        title: 'Water',
        icon: Icons.smoke_free,
        color: Colors.blue,
        currTimes: 9,
        Maxtimes: 10,
      ),
      ProgressItem(
        title: 'Study',
        color: Colors.blue,
        icon: Icons.self_improvement,
        currTimes: 25,
        Maxtimes: 30,
        completed: false,
      ),
      ProgressItem(
        title: 'Run',
        color: Colors.blue,
        icon: Icons.self_improvement,
        currTimes: 25,
        Maxtimes: 30,
        completed: false,
      ),
      ProgressItem(
        title: 'Run',
        color: Colors.blue,
        icon: Icons.self_improvement,
        currTimes: 25,
        Maxtimes: 30,
        completed: false,
      ),
    ];
    var l = Hive.box("users");

    return Scaffold(
        bottomNavigationBar: GNav(
            backgroundColor: Color(0xFF222322),
            onTabChange: (i) {
              print(i);
            },
            gap: 20,
            tabs: [
              GButton(
                  icon: Icons.home_filled,
                  text: "Home",
                  iconActiveColor: Color(0xFF8f8e88),
                  iconColor: Color(0xFF8f8e88),
                  textColor: Colors.white),
              GButton(
                  icon: Icons.bar_chart_rounded,
                  text: "Statistics",
                  iconColor: Color(0xFF8f8e88),
                  iconActiveColor: Color(0xFF8f8e88),
                  textColor: Colors.white),
              GButton(
                icon: Icons.hexagon_outlined,
                text: "????",
                iconColor: Color(0xFF8f8e88),
                iconActiveColor: Color(0xFF8f8e88),
                textColor: Colors.white,
              ),
            ]),
        backgroundColor: Color(0xFFf9fbed),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
          child: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hey, ${l.get("name")}!",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25,
                      )),
                  SizedBox(
                    height: 25,
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
                    firstDay: DateTime.utc(2024, 5, 20),
                    lastDay: DateTime.utc(2024, 6, 20),
                  ),
                  Text(
                    "Go For Daily",
                    style: GoogleFonts.montserrat(
                        color: Colors.black, fontSize: 50),
                  ),
                  Text(
                    "Wins",
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF4ca45c), fontSize: 110),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Habits",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 40,
                            letterSpacing: 4),
                      ),
                      GFButton(
                        shape: GFButtonShape.pills,
                        color: Color(0xFF4ca45c),
                        child: Text(
                          "+ New Habit",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            freq _selectedfreq = freq.daily;
                            action _selectedType = action.times;
                            return AlertDialog(
                              backgroundColor: Color(0xFFf9fbed),
                                title: Text('New Habit'),
                                content: StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState) {
                                  return Form(
                                      key: GlobalKey<FormState>(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: _nume,
                                            decoration: InputDecoration(labelText: 'Name'),
                                          ),
                                          Row(
                                            children: [
                                              Text("Habit Frequency: "),
                                              DropdownButton<freq>(
                                                value: _selectedfreq,
                                                onChanged: (freq? newValue) {
                                                  setState(() {
                                                    _selectedfreq = newValue!;
                                                  });
                                                },
                                                items: freq.values.map((freq value) {
                                                  return DropdownMenuItem<freq>(
                                                    value: value,
                                                    child: Text(value.name),
                                                  );
                                                }).toList(),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Action Type: "),
                                              DropdownButton<action>(
                                                value: _selectedType,
                                                onChanged: (action? newValue) {
                                                  setState(() {
                                                    _selectedType = newValue!;
                                                  });
                                                },
                                                items: action.values.map((action value) {
                                                  return DropdownMenuItem<action>(
                                                    value: value,
                                                    child: Text(value.name),
                                                  );
                                                }).toList(),
                                              )
                                            ],
                                          ),
                                          GFButton(
                                              child: Text("Add"),
                                              onPressed: () {
                                                // TO DO: PUT THE DATA IN THE BOX GODDAMIT
                                                print(_nume.text.trim() +
                                                    " " +
                                                    _selectedfreq.toString() +
                                                    " " +
                                                    _selectedType.toString());
                                              })
                                        ],
                                      ));
                                }));
                          }),
                    )
                    ],
                  ),
                  Container(
                    color: Color(0xFFf9fbed),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: progressItems.length,
                      itemBuilder: (context, index) {
                        final progressItem = progressItems[index];
                        return HabitCard(item: progressItem);
                      },
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

enum _SelectedTab { home, favorite }

List<int> zile = [13, 14, 15];

Widget _customDayBuilder(context, day) {
  // TO DO: take the days array of the hive box of the habits



  final isDays = zile.contains(day.day);

  final color = isDays ? Colors.green : Colors.grey;

  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
  );
}
