import 'package:face_attandance_system/view/dashboard_widget.dart';
import 'package:face_attandance_system/view/home_widget.dart';
import 'package:face_attandance_system/view/logout_widget.dart';
import 'package:face_attandance_system/view/members_widget.dart';
import 'package:face_attandance_system/view/settings_widget.dart';
import 'package:flutter/material.dart';
/*
import 'package:flutter_svg/flutter_svg.dart';
*/

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2;
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

  final List _colorList = [
    Colors.teal[200],
    Colors.white
  ];

  final List<Widget> _children = [
    DashboardWidget(Colors.green, "Dashboard"),
    MembersWidget(Colors.deepOrange, "Team Members",Icons.timer),
    HomeWidget(Colors.pinkAccent,"Home"),
    SettingsWidget(Colors.blueGrey, "Settings"),
    LogoutWidget(Colors.amberAccent, "Logout")
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.blueGrey,
        ),
          child:  BottomNavigationBar(key: globalKey,
            type: BottomNavigationBarType.shifting,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: new Text('Dashboard',
                    style: TextStyle(
                        color: _currentIndex == 0 ? _colorList[0] : _colorList[1]),
                  ),
                  icon: Icon(Icons.dashboard, color: _colorList[1],),
                  activeIcon: Icon(Icons.dashboard, color: _colorList[0],)
              ),
              BottomNavigationBarItem(
                  title: new Text('Members',
                    style: TextStyle(
                        color: _currentIndex == 1 ? _colorList[0] : _colorList[1]),
                  ),
                  icon: Icon(Icons.group, color: _colorList[1],),
                  activeIcon: Icon(Icons.group, color: _colorList[0],)
              ),
              BottomNavigationBarItem(
                  title: Text('Home',
                    style: TextStyle(
                        color: _currentIndex == 2 ? _colorList[0] : _colorList[1]),
                  ),
                  icon: Icon(Icons.home, color: _colorList[1],),
                  activeIcon: Icon(Icons.home, color: _colorList[0],)
              ),
              BottomNavigationBarItem(
                  title: Text('Settings',
                    style: TextStyle(
                      color: _currentIndex == 3 ? _colorList[0] : _colorList[1]),
                  ),
                  icon: Icon(Icons.settings, color: _colorList[1],),
                  activeIcon: Icon(Icons.settings, color: _colorList[0],)
              ),
              BottomNavigationBarItem(
                  title: Text('Logout',
                    style: TextStyle(
                        color: _currentIndex == 4 ? _colorList[0] : _colorList[1]),
                  ),
                  icon: Icon(Icons.power_settings_new, color: _colorList[1],),
                  activeIcon: Icon(Icons.power_settings_new, color: _colorList[0],)
              )
            ],
          ),
      )
    );
  }
}

