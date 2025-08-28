
import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_color.dart';
import 'package:flutter_projects/app/constants/app_fonts.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/otp_pop/controller/otp_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';


class OtpPopup extends GetView<OtpController> {
  const OtpPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: 564.w,
        height: 436.h,
        child: Stack(
          children: [
            Positioned(
              top: 16.h,
              right: 16.w,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: controller.closeWithoutResult,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 52.h),
                 Text(
                  "Verifying that it’s you!",
                  style: AppFonts.heading3Bold),
                 SizedBox(height: 28.h),
                 Text(
                  "You will receive an OTP on your mobile number xxxxxx8970",
                  textAlign: TextAlign.start,
                  style: AppFonts.bodyLargeRegular
                ),
                 SizedBox(height: 24.h),
                Pinput(
                  length: 6,
                  controller: controller.otpController,
                  defaultPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.w,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                 SizedBox(height: 32.h),
                Obx(
                      () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time,
                          size: 18, color: Colors.black54),
                      const SizedBox(width: 8),
                      Text(
                        controller.mmss,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text("|",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(width: 4),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8),
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: controller.secondsRemaining.value == 0
                            ? controller.resend
                            : null,
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: controller.secondsRemaining.value == 0
                                ? const Color(0xFFED1B2D)
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 48.h,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 120.w,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.prudentialRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56.r),
                        ),
                        padding:
                        const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      ),
                      onPressed: controller.submit,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



