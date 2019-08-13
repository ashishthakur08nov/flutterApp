import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class MembersWidget extends StatefulWidget {
  final Color color;
  final String screenTitle;
  final IconData icon;

  MembersWidget(this.color, this.screenTitle,this.icon);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MembersState(color,screenTitle,icon);
  }





}

class MembersState extends State<MembersWidget>{
  Employee employee;
  final Color color;
  final String screenTitle;
  final IconData icon;
  MembersState(this.color, this.screenTitle,this.icon);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Colors.deepOrange,
              padding: EdgeInsets.all(10.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(icon, size: 100.0, color: textStyle.color),
                  Text(screenTitle, style: TextStyle(fontSize: 40,color:Colors.black ))
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}



Future<Employee> fetchPost() async {
  final response =
  await http.get('https://4f9efeed.ngrok.io/');

  if (response.statusCode == 200) {

    // If server returns an OK response, parse the JSON.
    return Employee.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}


class EmployeeList {
  String id;
  String inTime;
  String name;
  String outTime;
  String totalTime;
  int visits;
  EmployeeList({this.inTime, this.id, this.name, this.outTime,this.totalTime,this.visits});

  factory EmployeeList.fromJson(Map<String, dynamic> json) {
    return EmployeeList(
      id: json['id'],
      inTime: json['inTime'],
      name: json['name'],
      outTime: json['outTime'],
      totalTime: json['totalTime'],
      visits: json['visits'],



    );
  }

}


class Employee {

  List<EmployeeList>result;

  Employee({this.result});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      result: json['result'],

    );
  }
}
