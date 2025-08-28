import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_color.dart';
import 'package:flutter_projects/app/constants/app_fonts.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/otp_pop/controller/otp_controller.dart';
import 'package:flutter_projects/app/screens/dashboard/view/widgets/otp_pop/view/otp_dailog_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class InsuranceFormController extends GetxController {
  // Options that user can select
  final List<String> options = ["Myself", "Spouse", "Parents", "Kids"];

  // Reactive variable to hold selected options
  var selectedOptions = <String>{"Myself", "Spouse"}.obs;

  // Text controller for mobile input
  var mobileController = TextEditingController();

  // Method to toggle selected options
  void toggleOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
  }
}

class InsuranceForm extends StatelessWidget {
  const InsuranceForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller using GetX
    final controller = Get.put(InsuranceFormController());

    return Padding(
      padding:  EdgeInsets.only(right: 233.w),
      child: Container(
        width: 580.w,
        height: 700.h,
        child: Card(
          color: AppColor.white,
          elevation: 8.r,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          // margin: const EdgeInsets.all(16),
          child: Padding(
            padding:  EdgeInsets.only(left: 52.w,right: 52.w,top: 52.h,bottom: 52.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                SizedBox(
                  width: 476.w,
                  child: Text.rich(
                  maxLines: 3,
                    TextSpan(
                      text: "India’s only ",
                      style: AppFonts.display2Regular,
                      children: [
                        TextSpan(
                          text: "health insurance ",
                          style:  AppFonts.display2Bold,
                        ),
                         TextSpan(
                          text: "that puts your family first",
                          style: AppFonts.display2Bold,
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(height:16.h),
                 Text(
                  "Find the right plan in 60 seconds!",
                  style: AppFonts.bodyLargeRegular,
                ),
                 SizedBox(height: 32.h),

                // Who you are insuring
                 Text(
                  "Who you are insuring?",
                  style: AppFonts.heading4,
                ),
                 SizedBox(height: 16.h),

                // Wrap with reactive UI updates using Obx
                Obx(
                      () => Wrap(
                    spacing: 10.w,
                    children: controller.options.map((option) {
                      final isSelected = controller.selectedOptions.contains(option);
                      return GestureDetector(
                        onTap: () {
                          controller.toggleOption(option);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 104.w,
                              height: 92.h,
                              padding:  EdgeInsets.only(top: 28.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:  AppColor.lightGrayBlue,
                                    width: 1.5.w),
                                borderRadius: BorderRadius.circular(6.r),
                                color: AppColor.white,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    option,
                                    style: AppFonts.heading4,
                                  ),

                                ],
                              ),
                            ),

                              Positioned(
                                bottom: -10.h,
                                left: 42.w,
                                child: CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor:isSelected ? AppColor.prudentialRed :AppColor.culturedWhite,
                                  child:  Icon(Icons.check, color:isSelected ? AppColor.white: AppColor.neutralGray, size: 15.w),
                                ),
                              ),

                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                 SizedBox(height: 16.h),

                // Mobile Number Input
                MobileNumberInput(),
                 SizedBox(height: 32.h),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () async{

                      Get.put(OtpController());
                       await Get.dialog(const OtpPopup(), barrierDismissible: false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.prudentialRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56.r),
                      ),
                    ),
                    child:  Text(
                      "Get the Best Offer",
                      style: AppFonts.labelButtonText,


                    ),
                  ),
                ),

                 SizedBox(height: 20.h),

                // Bottom Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    Text(
                      "Trusted by 1M+ Customers",
                      style: AppFonts.bodySmallSemiBold,
                    ),
                    Text(
                      "|",
                      style: AppFonts.bodySmallSemiBold,
                    ),
                    Text(
                      "Rated 4.8/5 by users",
                      style: AppFonts.bodySmallSemiBold,
                    ),
                    Text(
                      "|",
                      style: AppFonts.bodySmallSemiBold,
                    ),
                    Text(
                      "Claim Approval 99%",
                      style: AppFonts.bodySmallSemiBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class MobileNumberInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile number',
              style: AppFonts.bodySmallSemiBold,
            ),
            SizedBox(height: 4.h),
            SizedBox(
              height: 48.h,
              width: 476.w,
              child: TextFormField(

                controller: _controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+91 ',
                  hintText: 'Enter mobile number',
                  hintStyle: AppFonts.bodyMediumRegular,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: AppColor.lightGrayBlue),
                  ),
                ),
              ),
            ),
          ]);


  }
}
