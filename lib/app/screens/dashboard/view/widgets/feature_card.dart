import 'package:flutter/material.dart';
import 'package:flutter_projects/app/screens/dashboard/view/home/service/model/feature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FeatureCard extends StatelessWidget {
  final Feature item;
  const FeatureCard({super.key, required this.item});

  Color get pruRed => const Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(item.icon, size: 36.r, color: Colors.black87),
            SizedBox(height: 14.h),
            Text(
              item.title,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, height: 1.2),
            ),
            SizedBox(height: 10.h),
            Text(
              item.subtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.65),
                height: 1.35,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.arrow_right_alt, size: 22.r, color: pruRed),
            ),
          ],
        ),
      ),
    );
  }
}







