import 'package:face_attandance_system/view/main_page_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(AttendanceApp());

class AttendanceApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

