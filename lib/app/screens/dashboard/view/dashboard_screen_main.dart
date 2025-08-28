
import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/dashboard_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'dasboard_mobile.dart';

class DashboardScreenMain extends StatelessWidget {
  const DashboardScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(desktop: (BuildContext context)=>DashboardWeb() ,mobile:(BuildContext context)=> DashboardMobile(),);
  }
}
