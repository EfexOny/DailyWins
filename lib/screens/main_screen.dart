import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/data/ProgressItem.dart';
import 'package:tracker/screens/progress_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

 

  @override
  Widget build(BuildContext context) {
     List<ProgressItem> progressItems = [
  ProgressItem(
    title: 'Water',
    color: Colors.blue,
    currentValue: 9,
    maxValue: 10,
  ),
  ProgressItem(
    title: 'Yoga',
    color: Colors.blue,
    currentValue: 30,
    maxValue: 30,
    completed: true, 
  ),
  ProgressItem(
    title: 'Study',
    color: Colors.blue,
    currentValue: 25,
    maxValue: 30,
    completed: false,
  ),

];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20,right:20,top: 40.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        
                Row(
                
                  children: [
                              GFAvatar(),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("morning," ,style: GoogleFonts.archivo(color:Colors.black45),),
                                Text("Irimia Mihai",style: GoogleFonts.archivo(fontSize:22,color:Colors.black))
                              ],),
                              Spacer(),
                              GFButton(shape:GFButtonShape.pills,
                                onPressed:() {
                                print("add");
                              },)
                            ],        
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,),
                  Column(
                      
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        Text("track" , style: GoogleFonts.archivo(fontSize: 25,color:Colors.black45),),
                        Text("your habits",style: GoogleFonts.archivo(fontSize: 70,)),

                          // TO DO LIST

                          ProgressTracker(progressItems: progressItems )
                      ],
                    ),
              ],              
          ),
        ),
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  final IconData icon;

  HabitCard({required this.color, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WaterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "water",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("glasses: 9 / 10"),
              Text("max: 17 glasses"),
            ],
          ),
          SizedBox(height: 10),
          Text("streaks: 10 days"),
        ],
      ),
    );
  }
}