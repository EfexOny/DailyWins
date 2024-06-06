import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/screens/others/habit_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

}

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
];

    return Scaffold(
      bottomNavigationBar: DotNavigationBar(
        marginR: const EdgeInsets.only(bottom: 0, right: 40, left: 40),
        paddingR: const EdgeInsets.only(bottom: 1, top: 5),
        itemPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        duration: const Duration(milliseconds: 700),
        backgroundColor: Color(0xFF242424),
        onTap: _handleIndexChanged,
        items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              unselectedColor: Color(0xFF58a45c),
              selectedColor: Colors.white,
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.hexagon),
              unselectedColor: Color(0xFF58a45c),
              selectedColor: Colors.white,
            ),
          ],),
      backgroundColor: Color(0xFFf9fbed),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0,right: 20.0,left: 20.0),
        child: SafeArea(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text("Hey, Mihai!",style: GoogleFonts.montserrat(color:Colors.black,fontSize:25,)),
                    SizedBox(height: 25,),
                    TableCalendar( calendarFormat: _calendarFormat,
                    headerVisible: false,
                    pageAnimationCurve: Curves.bounceIn,
                    headerStyle: HeaderStyle(titleCentered: true),
                      focusedDay: DateTime.now(),firstDay: DateTime.utc(2024,5,20),lastDay: DateTime.utc(2024,6,20),
                      ),
                    Text("Go For Daily",style: GoogleFonts.montserrat(color:Colors.black,fontSize:50),),
                    Text("Wins",style: GoogleFonts.montserrat(color:Colors.green,fontSize:110),),
                    Divider(),
                    Text("Habits",style: GoogleFonts.montserrat(color:Colors.black,fontSize:40,letterSpacing:4),),
                    for(int i=0;i<progressItems.length;i++)
                      HabitCard(item: progressItems[i]),
              ],
            ),
           ),
        ),
      )
      );
  }
}
enum _SelectedTab { home, favorite }
