import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/screens/conditional_screen.dart';

class IntroductoryPage extends StatefulWidget {
  const IntroductoryPage({super.key});

  @override
  State<IntroductoryPage> createState() => _IntroductoryPageState();
}

class _IntroductoryPageState extends State<IntroductoryPage> {
  final _nume = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9fbed),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("How can I call you?",style: GoogleFonts.montserrat(fontSize:40),),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50.0),
              child: Center(child: TextField(
                controller: _nume,
              ),),
            ),
            GFButton(child: Text("Confirm"),
              onPressed: () async {
              var nm = Hive.box("users");
              nm.put("name", _nume.text.trim());
              nm.close();

              Navigator.push(context, MaterialPageRoute(builder: (context) => ConditionalScreen(),));
                
              // Do your HIVE thingie
            })
          ],
        ),
      ),
    );
  }
}