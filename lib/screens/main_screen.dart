import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/data/TimeProgressItem.dart';
import 'package:tracker/screens/others/habit_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});



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
      bottomNavigationBar:Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(color: Colors.black,
            blurRadius: 1,
            offset: Offset(0,2)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: BottomNavigationBar(

            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.hexagon_outlined),label: "" ),
            BottomNavigationBarItem(icon: Icon(Icons.hexagon_outlined),label: ""),
          ],),
        ),
      ),
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
