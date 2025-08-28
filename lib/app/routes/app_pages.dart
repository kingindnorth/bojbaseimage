
import 'package:flutter_projects/app/screens/dashboard/view/buy_online/binding/buy_online_landing_binding.dart';
import 'package:flutter_projects/app/screens/dashboard/view/buy_online/view/buy_online_landing_main.dart';
import 'package:flutter_projects/app/screens/dashboard/view/dashboard_screen_main.dart';
import 'package:flutter_projects/app/screens/dashboard/view/emergency/view/emergency_view.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/view/home_main.dart';
import 'package:get/get.dart';

import '../screens/dashboard/view/home/binding/home_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.BUYONLINELANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeMain(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardScreenMain(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.emergency,
      page: () => const EmergencyView(),
    ),
    GetPage(
      name: _Paths.BUYONLINELANDING,
      page: () =>  BuyOnlineLandingMain(),
      binding: BuyOnlineLandingBinding(),
    ),
  ];
}