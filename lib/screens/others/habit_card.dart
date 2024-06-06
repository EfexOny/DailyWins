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
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
                  BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color(0xFFf8f4e4),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
              ) ,
                child: Icon(item.icon),),
              SizedBox(width: 20.0,),
              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
              Text(item.title,style: TextStyle(fontSize: 17),),
            Text("NEW",style: TextStyle(color:Color(0xFFda2aa8),fontSize: 12),),
              ],),
             const Spacer(),
             Container(width: 2,height: 50,color: Color.fromARGB(97, 75, 75, 75),),
             SizedBox(width: 20,),
             Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_filled_outlined),
                  Text("25 min")
                ],
             )

          ],
        ),
      ),
    );
  }
}