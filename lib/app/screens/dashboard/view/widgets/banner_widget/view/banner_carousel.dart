import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/banner_widget/controller/banner_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BannerCarousel extends GetView<BannerController> {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive banner height: ~50% of screen height on web/desktop.
    final double bannerHeight = (0.5.sh).clamp(260.h, 560.h).toDouble();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: SizedBox(
            height: bannerHeight,
            width: 1.sw, // full available width
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Whole image is clickable
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: controller.onBannerTap,
                  child: PageView.builder(
                    controller: controller.pageCtrl,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.banners.length,
                    itemBuilder: (_, i) {
                      final item = controller.banners[i];
                      // Swap to Image.network(item.imageUrl, fit: BoxFit.cover) when using API URLs
                      return Image.asset(item.imageUrl, fit: BoxFit.cover);
                    },
                  ),
                ),

                // Pagination dots (keep or remove)
                Positioned(
                  left: 16.w,
                  bottom: 16.h,
                  child: Obx(() => Row(
                    children: List.generate(
                      controller.banners.length,
                          (i) => Container(
                        width: 10.r,
                        height: 10.r,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == controller.currentIndex.value
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          border: Border.all(color: Colors.black12, width: 1.w),
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),

        // If you truly want only a clickable image, remove everything below.
        SizedBox(height: 12.h),
      ],
    );
  }
}


