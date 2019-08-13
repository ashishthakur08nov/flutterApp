import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  final Color color;
  final String screenTitle;

  LogoutWidget(this.color, this.screenTitle);

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