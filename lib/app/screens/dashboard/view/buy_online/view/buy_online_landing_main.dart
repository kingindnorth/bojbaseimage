import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/buy_online/view/buy_online_landing_mobile.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'buy_online_landing_web.dart';


class BuyOnlineLandingMain extends StatelessWidget {
  const BuyOnlineLandingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(desktop: (BuildContext context)=>BuyOnlineLandingWeb() ,mobile:(BuildContext context)=> BuyOnlineLandingMobile(),);
  }
}