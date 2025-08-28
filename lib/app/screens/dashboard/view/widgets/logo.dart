import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 240.w,top: 40.h),
      child: Image.asset(AppAssets.prudentialLogo,width: 205.w,height: 40.h, fit: BoxFit.fill,),
    );
  }
}
