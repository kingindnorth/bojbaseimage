// lib/main.dart
// Footer (Flutter Web) using GetX + ScreenUtil
// Right-most column stacks: About Prudential (top) + Login (bottom)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const FooterDemoApp());

class FooterDemoApp extends StatelessWidget {
  const FooterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Footer Demo',
        theme: ThemeData(useMaterial3: true),
        initialBinding: BindingsBuilder(() => Get.put(FooterController())),
        home:  FooterDemoHome(),
      ),
    );
  }
}

class FooterDemoHome extends StatelessWidget {
  FooterDemoHome({super.key}){Get.put(FooterController());}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 48.h),
            const Placeholder(fallbackHeight: 300),
            SizedBox(height: 32.h),
            const DashboardFooter(),
          ],
        ),
      ),
    );
  }
}

/* =============================== CONTROLLER =============================== */

class FooterController extends GetxController {
  // Order used for the five visual columns:
  // 0 Insurance, 1 Tools, 2 Claims, 3 Legal, 4 About, 5 Login (About+Login stacked)
  final sections = <FooterSection>[
    FooterSection('Insurance Plans', [
      'Health Insurance Plans',
      'Individual Health Plans',
      'Family Floater Plans',
      'Critical Illness Insurance',
      'Maternity Health Insurance',
      'Senior Citizen Insurance',
      'Top-Up Health Insurance',
      'Group Health Insurance',
      'OPD & Wellness Add-ons',
    ]),
    FooterSection('Tools & Educational Resources', [
      'Premium Calculator',
      'Tax Savings Calculator',
      'Claims Estimator',
      'Health Insurance Comparison',
      'Hospital Network Finder',
      'Renewal Cost Calculator',
      'Health Blogs',
      'Edu-Bits Videos',
      'FAQs',
      'Glossary of Insurance Terms',
      'Download Brochure',
      'Download Center',
    ]),
    FooterSection('Claims', [
      'File a Claim',
      'Claims status and tracking',
      'Claims Summary',
      'Grievance Redressal',
    ]),
    FooterSection('Legal', [
      'IRDAI Consumer Education',
      'Terms & Conditions',
      'Privacy Policy',
    ]),
    FooterSection('About Prudential', [
      'About Us',
      'Careers',
    ]),
    FooterSection('Login', [
      'Customer Login',
      'Renew Policy',
      'Download Policy Document',
      'Agent / Broker Login',
      'Track My Policy',
      'Contact Us',
    ]),
  ].obs;

  final address = '501, BKC Corporate Tower,\nBandra (E), Mumbai – 400051';
  final phones = '1800 123 4567 | 1860 500 7890';
  final email  = 'prudentialcareforyou@phi.com';

  final disclaimer = [
    'Disclaimer: Health insurance is a subject of solicitation.',
    '1. Pre-authorisation approvals are processed within 30 minutes for valid and active policies.',
    '2. Claims data is considered from the inception of services starting [Year] up to [Recent Month/Year].',
    '3. Premiums shown are indicative and based on a standard plan variant.',
    '4. Never share OTP, CVV, passwords, or bank credentials with unknown individuals.',
  ];
}

/* ================================= MODEL ================================= */

class FooterSection {
  final String title;
  final List<String> links;
  FooterSection(this.title, this.links);
}

/* ================================= VIEW ================================== */

class DashboardFooter extends GetView<FooterController> {
  const DashboardFooter({super.key});

  Color get _bg    => const Color(0xFF1F2328);
  Color get _muted => Colors.white70;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: _bg,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1240.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topRow(text),
              SizedBox(height: 24.h),
              _columnsArea(text),

              Divider(color: Colors.white12, height: 28.h),
              _disclaimer(text),
            ],
          ),
        ),
      ),
    );
  }

  /* ----------------------------- TOP CONTACT BAND ------------------------ */

  Widget _topRow(TextTheme text) {
    return Wrap(
      spacing: 32.w,
      runSpacing: 12.h,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRUDENTIAL',
              style: text.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                fontSize: 22.sp,
              ),
            ),
            _iconLine(
              Icons.location_on_outlined,
              controller.address,
              btnText: 'View Regional Offices',
              onPressed: () {},
              showButton: true,
            ),
          ],
        ),
        SizedBox(width: 12.w),
        _iconLine(
          Icons.call,
          controller.phones,
          btnText: 'View Other Contact Numbers',
          onPressed: () {},
          showButton: true,
        ),
        _iconLine(Icons.email_outlined, controller.email),
      ],
    );
  }

  Widget _iconLine(
      IconData icon,
      String text, {
        String? btnText,
        VoidCallback? onPressed,
        bool showButton = false,
      }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, // keep icon at top
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Icon(icon, size: 16.r, color: _muted),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
              style: TextStyle(color: _muted, fontSize: 12.sp, height: 1.35),
            ),
            if (showButton && (btnText ?? '').isNotEmpty)
              GestureDetector(
                onTap: onPressed,
                child: Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        btnText!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.arrow_forward, size: 14.r, color: Colors.white),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  /* ----------------------------- COLUMNS AREA ---------------------------- */

  Widget _columnsArea(TextTheme text) {
    final s = controller.sections; // 0..5 as declared
    return LayoutBuilder(
      builder: (_, c) {
        // Wide layout: 5 columns. Right-most stacks About (top) + Login (bottom).
        final isWide = c.maxWidth >= 1000.w;
        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _linkColumn(s[0], text)), // Insurance
              SizedBox(width: 24.w),
              Expanded(child: _linkColumn(s[1], text)), // Tools
              SizedBox(width: 24.w),
              Expanded( // Right-most stacked column: About (top) + Login (bottom)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _linkColumn(s[2], text),         // About Prudential
                    SizedBox(height: 24.h),
                    _linkColumn(s[3], text),         // Login
                  ],
                ),
              ),
              Expanded( // Right-most stacked column: About (top) + Login (bottom)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _linkColumn(s[4], text),         // About Prudential
                    SizedBox(height: 24.h),
                    _linkColumn(s[5], text),
                    SizedBox(height: 16.h),
                    _socialRow(text),// Login
                  ],
                ),
              ),
            ],
          );
        }

        // Narrow screens: wrap them naturally (2-up).
        final perCol = (c.maxWidth / 2).clamp(220.w, 360.w);
        return Wrap(
          spacing: 24.w,
          runSpacing: 24.h,
          children: [
            for (final sec in s)
              SizedBox(width: perCol, child: _linkColumn(sec, text)),
          ],
        );
      },
    );
  }

  Widget _linkColumn(FooterSection group, TextTheme text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.title,
            style: text.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 14.sp,
            )),
        SizedBox(height: 10.h),
        ...group.links.map(
              (t) => Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                t,
                style: TextStyle(color: _muted, fontSize: 12.sp, height: 1.25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* ------------------------------- SOCIAL -------------------------------- */

  Widget _socialRow(TextTheme text) {
    final icons = <IconData>[Icons.facebook, Icons.close, Icons.close, Icons.ondemand_video];
    return Row(
      children: [
        Text('Stay Connected',
            style: text.titleSmall?.copyWith(color: Colors.white, fontSize: 14.sp)),
        SizedBox(width: 12.w),
        for (final i in icons) ...[
          Container(
            width: 32.r,
            height: 32.r,
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white38, width: 1),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(i, size: 16.r, color: _muted),
              padding: EdgeInsets.zero,
              tooltip: 'Open',
            ),
          ),
        ],
      ],
    );
  }

  /* ----------------------------- DISCLAIMER ------------------------------ */

  Widget _disclaimer(TextTheme text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('© 2025 Prudential, Inc.',
            style: text.bodySmall?.copyWith(color: _muted, fontSize: 11.sp)),
        SizedBox(height: 6.h),
        ...controller.disclaimer.map(
              (line) => Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text(
              line,
              style: text.bodySmall?.copyWith(color: _muted, height: 1.35, fontSize: 11.sp),
            ),
          ),
        ),
      ],
    );
  }
}
