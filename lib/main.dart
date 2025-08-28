import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/app/core/localization/translation_service.dart';
import 'package:flutter_projects/app/routes/app_pages.dart';
import 'package:flutter_projects/app/screens/dashboard/view/buy_online/binding/buy_online_landing_binding.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/view/home_main.dart';

import 'package:flutter_projects/app/screens/dashboard/view/widgets/banner_widget/controller/banner_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';








Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:(kIsWeb && !GetPlatform.isIOS && !GetPlatform.isAndroid) ? Size(1920, 1080) : Size(360 , 690),

      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,

      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        translations: TranslationService(),
//        locale: const Locale('zh', 'CN'),
        locale: const Locale('en', 'US'),

        fallbackLocale: const Locale('en', 'US'),
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: BuyOnlineLandingBinding(),
        home:  HomeMain(),
      //  home:DashboardWeb(),
        routingCallback: (routing) {
          if (routing?.current == Routes.HOME && Get.isRegistered<BannerController>()) {
            Get.find<BannerController>().resetToFirst();
          }
        },
      ),
    );
  }
}

