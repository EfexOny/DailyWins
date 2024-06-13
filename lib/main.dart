import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/screens/others/conditional_screen.dart';
import 'package:tracker/screens/data/user.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  var users = await Hive.openBox("users");
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const ConditionalScreen(),
      ),
      designSize: Size(1080, 2220),
    );
  }
}
