import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/service/model/feature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  static  double pillHeightExpanded = 64.h;
  static  double pillHeightCollapsed = 60.h;
  static  double baseExpanded = 120.h;
  late final TabController tabController;
  final selectedTab = 0.obs;
  // Reactive lists (mock now, plug API later)
  final policyHolder = <Feature>[].obs;
  final applying = <Feature>[].obs;

  // Layout knobs (logical units; scaled where used)
  final double containerMaxWidth = 1240;
  final double gap = 16;
  final double tileHeight = 220;

  final scrollCtrl = ScrollController();
  final collapsed = false.obs;
  final selectedIndex = 0.obs;

  final isFirstLoad = true.obs;

  double get overlap => collapsed.value ? 0 : 24.h;
  double get pillHeight =>
      collapsed.value ? pillHeightCollapsed : pillHeightExpanded;
  double get expandedHeight => baseExpanded + overlap;

  Color get pillBg => collapsed.value ? Colors.white : const Color(0xFFEF4136);
  Color get pillText => collapsed.value ? Colors.black87 : Colors.white;
  Color get pillIndicator =>
      collapsed.value ? const Color(0xFFEF4136) : Colors.white;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    selectedTab.value = tabController.index;
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        selectedTab.value = tabController.index;
      }
    });

    _loadPolicyHolder();
    _loadApplying();
    scrollCtrl.addListener(_onScroll);

    // Simulate data loading — replace with real API
    Future.delayed(const Duration(milliseconds: 1200), () {
      isFirstLoad.value = false;
    });
  }
  Future<void> _loadPolicyHolder() async {
    await Future.delayed(const Duration(milliseconds: 250));
    policyHolder.assignAll([
      Feature(Icons.handshake_outlined, 'View & manage my policy',
          'View & download policy documents'),
      Feature(Icons.edit_note_outlined, 'Request changes in policy',
          'View & modify policy details'),
      Feature(Icons.receipt_long_outlined, 'Raise & track claims',
          'Track your claim status'),
      Feature(Icons.favorite_border, 'Health management tools',
          'Wellness & rewards'),
      Feature(Icons.verified_user_outlined, 'e-KYC', 'Verify your identity'),
      Feature(Icons.payment_outlined, 'Payments', 'Premiums & history'),
      Feature(Icons.support_agent_outlined, 'Get support',
          'Chat or raise a service request'),
      Feature(Icons.document_scanner_outlined, 'Update documents',
          'KYC / address / income proofs'),
    ]);
  }

  Future<void> _loadApplying() async {
    await Future.delayed(const Duration(milliseconds: 250));
    applying.assignAll([
      Feature(Icons.description_outlined, 'Track my application',
          'Check status & pending actions'),
      Feature(Icons.upload_file_outlined, 'Upload documents',
          'Submit required proofs'),
      Feature(Icons.call_outlined, 'Request a callback',
          'We will contact you shortly'),
    ]);
  }

  void _onScroll() {
    final isCollapsed = scrollCtrl.offset > (baseExpanded - kToolbarHeight);
    if (isCollapsed != collapsed.value) collapsed.value = isCollapsed;
  }

  @override
  void onClose() {
    scrollCtrl.removeListener(_onScroll);
    scrollCtrl.dispose();
    tabController.dispose();
    super.onClose();
  }
}
