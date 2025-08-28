import 'package:flutter_projects/app/screens/dashboard/view/buy_online/controller/buy_online_landing_controller.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/controller/home_controller.dart';
import 'package:get/get.dart';

class BuyOnlineLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(BuyOnlineLandingController());
  }
}
