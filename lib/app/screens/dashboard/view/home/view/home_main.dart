import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/view/home_mobile.dart';


import 'package:responsive_builder/responsive_builder.dart';

import 'home_web.dart';




class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(desktop: (BuildContext context)=>HomeView() ,mobile:(BuildContext context)=> HomeMobile(),);
  }
}