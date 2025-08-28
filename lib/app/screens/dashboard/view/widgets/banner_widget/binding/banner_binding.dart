import 'package:flutter_projects/app/screens/dashboard/view/widgets/banner_widget/controller/banner_controller.dart';
import 'package:get/get.dart';


class BannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(() => BannerController());
  }
}
