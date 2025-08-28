import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_assets.dart';
import 'package:flutter_projects/app/constants/app_color.dart';

import 'package:flutter_projects/app/core/common_widgets/app_text.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/controller/home_controller.dart';

import 'package:flutter_projects/app/screens/dashboard/view/widgets/insurance_form/view/insurance_form_widget.dart';

import 'package:flutter_projects/app/screens/dashboard/view/widgets/pill_nav.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/shimmer_card.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/shimmer_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';





class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor.white,
        body: CustomScrollView(
          controller: c.scrollCtrl,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: c.expandedHeight,
              titleSpacing: 0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title:  c.collapsed.value ? _TopBarRow(logoHeight: 40.h) : null,
              flexibleSpace:  c.collapsed.value
                  ? const SizedBox.shrink()
                  : SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: _TopBarRow(logoHeight: 40.h),
                ),
              ),

              //  flexibleSpace: const FlexibleSpaceBar(background: HeroWelcome()),
              // Constant bottom height to avoid overflow on transitions
              bottom: PreferredSize(
                preferredSize:
                 Size.fromHeight(HomeController.pillHeightExpanded),
                child: Transform.translate(
                  offset: Offset(0, c.overlap),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 240.w),
                    child: SizedBox(
                      height: HomeController.pillHeightExpanded,
                      child: Center(
                        child: PillNav(
                          height: c.pillHeight,
                          bg: c.pillBg,
                          text: c.pillText,
                          indicator: c.pillIndicator,
                          selectedIndex: c.selectedIndex.value,
                          onTabSelected: (i) => c.selectedIndex.value = i,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          //  Spacer so content doesn't hide under pill
            SliverToBoxAdapter(
              child: SizedBox(height: (c.overlap == 0 ? 8 : c.overlap + 8)),
            ),

            // BODY:
            if (c.isFirstLoad.value) ..._buildShimmerBody()
            else  SliverToBoxAdapter(child:   Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppAssets.familyPhotoLanding,
                  width: double.infinity,
                  height: 716,
                  fit: BoxFit.cover,

                ),
                Positioned(
                  right: 40,
                  bottom: -60, // pushes 20% into white container
                  child: InsuranceForm(),
                ),
              ]))
          ],
        ),
      );
    });
  }

  List<Widget> _buildShimmerBody() {
    return [
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(4, (i) => const ShimmerCard()),
        ),
      ),
      SliverList.builder(
        itemCount: 8,
        itemBuilder: (_, i) => const ShimmerListTile(),
      ),
    ];
  }


}

class _TopBarRow extends StatelessWidget {
  final double logoHeight;
  const _TopBarRow({required this.logoHeight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 240.w),

        Image.asset(
          AppAssets.prudentialLogo,
          height: logoHeight,
          width: 205.w,
          fit: BoxFit.contain,      // avoid stretching
        ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(AppAssets.customerSmallSupportIconGrey,
              width: 16.w, height: 16.h),

          label: AppText(
            newText: 'cta_talk_to_expert'.tr,
            textFontSize: 14,textColor: AppColor.charcoalBlack,
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56.r),

   side     : BorderSide(
    color: AppColor.lightGrayBlue,
    width: 1,
    ),

            ),

            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),

          ),

        ),
        SizedBox(width: 240.w),
      ],
    );
  }
}