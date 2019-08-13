import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final Color color;
  final String screenTitle;

  SettingsWidget(this.color, this.screenTitle);

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