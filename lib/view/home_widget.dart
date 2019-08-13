import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeWidget extends StatelessWidget {
  final Color color;
  final String screenTitle;

  HomeWidget(this.color, this.screenTitle);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(screenTitle),
      ),
    );

  }
}


