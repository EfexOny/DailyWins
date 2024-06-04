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
    icon: Icons.smoke_free,
    color: Colors.blue,
    currentValue: 9,
    maxValue: 10,
  ),
  ProgressItem(
    title: 'Study',
    color: Colors.blue,
    icon: Icons.self_improvement,
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
