import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      backgroundColor: Color(0xFFf9fbed),
      body: Container(
        child: Column(
          children: [
            Center(child: TextField(
              controller: _nume,
            ),),
            GFButton(child: Text("Confirm"),
              onPressed: () {
              // Do your HIVE thingie
            })
          ],
        ),
      ),
    );
  }
}