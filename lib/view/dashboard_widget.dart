import 'package:flutter/material.dart';

import 'members_widget.dart';

class DashboardWidget extends StatelessWidget {
  final Color color;
  final String screenTitle;

  DashboardWidget(this.color, this.screenTitle);

  static final showGrid = true; // Set to false to show ListView


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: screenTitle,
        home: Scaffold(appBar: AppBar(
          title: Text(screenTitle),
        ),
            body: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.only(bottom: 15.0,top: 15.0,left: 15.0,right: 15.0),
                children: List.generate(details.length, (index) {
                  return Center(
                    child: RenderEmployee(
                        companyEmployeeDetail: details[index]),
                  );
                }
                )
            )
        )
    );
  }


}



class CompanyEmployeeDetails {
  const CompanyEmployeeDetails({this.title, this.icon});
  final String title;
  final IconData icon;
}

List<CompanyEmployeeDetails> details = const <CompanyEmployeeDetails>[
  const CompanyEmployeeDetails(title: 'Employee', icon: Icons.people),
  const CompanyEmployeeDetails(title: 'In Time', icon: Icons.time_to_leave),
  const CompanyEmployeeDetails(title: 'Out Time', icon: Icons.timer),
  const CompanyEmployeeDetails(title: 'Total Time', icon: Icons.timer),
  const CompanyEmployeeDetails(title: 'Visits', icon: Icons.person_add),
  const CompanyEmployeeDetails(title: 'Half Day', icon: Icons.view_day),
  const CompanyEmployeeDetails(title: 'On Leave', icon: Icons.time_to_leave),
  const CompanyEmployeeDetails(title: 'Sick Leave', icon: Icons.perm_phone_msg),

];


class RenderEmployee extends StatelessWidget {
  const RenderEmployee({Key key, this.companyEmployeeDetail}) : super(key: key);
  final CompanyEmployeeDetails companyEmployeeDetail;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;

    return Card(
        color: Colors.blue,
        margin: EdgeInsets.only(bottom: 12.0,top: 12.0,left: 12.0,right: 12.0),
        child: InkWell(
            onTap: () {
              // function gets executed on a tap
              print(companyEmployeeDetail.title);
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MembersWidget(Colors.deepOrange, companyEmployeeDetail.title,companyEmployeeDetail.icon);
              }));

            },
            child: Center(child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  Icon(companyEmployeeDetail.icon, size: 40.0,
                      color: textStyle.color),

                  Text(companyEmployeeDetail.title, style: TextStyle(fontSize: 20,color:Colors.white )),
                ]

            ),
            )
        ),
    );
  }
}
