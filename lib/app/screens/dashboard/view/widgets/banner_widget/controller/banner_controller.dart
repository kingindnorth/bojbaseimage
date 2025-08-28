import 'package:flutter/material.dart';
import 'package:flutter_projects/app/routes/app_pages.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/banner_widget/service/model/banner_item.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final pageCtrl = PageController();
  final currentIndex = 0.obs;

  // Local assets now; later replace with network URLs from API.
  final banners = <BannerItem>[
    BannerItem(imageUrl: 'assets/banner_1.jpg'),
    BannerItem(imageUrl: 'assets/banner_2.jpg'),
    BannerItem(imageUrl: 'assets/banner_3.jpg'),
  ].obs;

  void onPageChanged(int i) => currentIndex.value = i;

  Future<void> goNext() async {
    if (currentIndex.value < banners.length - 1) {
      currentIndex.value++;
      await pageCtrl.animateToPage(currentIndex.value,
          duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
    }
  }

  Future<void> goPrev() async {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      await pageCtrl.animateToPage(currentIndex.value,
          duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
    }
  }

  /// Called from main.routingCallback when returning to Home
  void resetToFirst() {
    if (pageCtrl.hasClients) pageCtrl.jumpToPage(0);
    currentIndex.value = 0;
  }

  /// Tap handler for the whole banner image
  void onBannerTap() {
    // If banners have specific deeplinks, decide based on currentIndex.
    // For now, always go to the Emergency page.
    Get.toNamed(Routes.emergency);
  }

  @override
  void onClose() {
    pageCtrl.dispose();
    super.onClose();
  }
}


