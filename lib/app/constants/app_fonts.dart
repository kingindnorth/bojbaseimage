
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppFonts {
  static const small = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.openSans(
        fontWeight: semiBold, fontSize: 48.0, letterSpacing: -1, height: 48),
    labelMedium: GoogleFonts.oswald(fontWeight: semiBold, fontSize: 16.0),
  );

  var h1 = GoogleFonts.openSans(
      fontWeight: semiBold, fontSize: 48.0, letterSpacing: -1, height: 48);

  static final display2Regular=  GoogleFonts.openSans(
  fontWeight: regular, // Changed from 600 to 700, bug raised in VQA
  fontSize: 42,
  color: AppColor.darkCharcoal,
  letterSpacing: -0.01,
    height: 1.16.h

);
  static final display2Bold=  GoogleFonts.openSans(
    fontWeight: bold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 42,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
      height: 1.16.h
  );

  static final bodyLargeRegular=  GoogleFonts.openSans(
    fontWeight: regular, // Changed from 600 to 700, bug raised in VQA
    fontSize: 16,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
  );
  static final bodySmallSemiBold=  GoogleFonts.openSans(
    fontWeight: semiBold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 12,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
  );
  static final bodyMediumRegular =
  GoogleFonts.openSans(
    fontWeight: regular, // Changed from 600 to 700, bug raised in VQA
    fontSize: 14,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
  );

  static final  labelButtonText = GoogleFonts.openSans(
    fontWeight: semiBold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 14,
    color: AppColor.white,
    letterSpacing:  -0.01,
  );


  static final heading3Bold=  GoogleFonts.openSans(
    fontWeight: bold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 24,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
  );
  static final heading4=  GoogleFonts.openSans(
    fontWeight: bold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 20,
    color: AppColor.darkCharcoal,
    letterSpacing:  -0.01,
  );
  //Used : Quote initiation - bottom sheet
  static final linkText = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: _semiBold,
    color: AppColor.linkBlue,
    letterSpacing: -0.01,
  );

  static final bottomSheetLinkText = GoogleFonts.roboto(
    fontWeight: _bold, // Changed from 600 to 700, bug raised in VQA
    fontSize: 14,
    color: AppColor.linkBlue,
    letterSpacing: -0.01,
  );

  static final newBusinessInsightFontStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColor.newBussinessInsightColor,
  );

//used in Tenure section quote
  static final hardText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: _semiBold,
    color: AppColor.textHigh,
    letterSpacing: -0.01,
  );
//Used in BottomSheet Optima Restore - Sum Insured
  static final hardText2 = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: _bold,
    color: AppColor.textHigh,
    letterSpacing: -0.01,
  );

  static final indiSumBSParticularText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: semiBold,
    color: AppColor.textColorFormRange,
    letterSpacing: -0.01,
  );

  //used in Optimun restore BottomSheet
  static final headingText = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: medium,
    color: AppColor.textHigh,
  );

  static final inidSumInsuredRangeText = GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: medium,
    color: AppColor.textColorFormRange,
  );

  static final optimaRestoreAndHealthSurakshaNudgeText = GoogleFonts.roboto(
    fontSize: 14.00,
    fontWeight: _regular,
    color: AppColor.darkJungleGreen,
    height: 1.6,
  );
  static final dontAskAgain = GoogleFonts.roboto(
    fontSize: 12.00,
    fontWeight: medium,
    color: AppColor.smokeyGrey,
  );

  static final sumInsuredEach = GoogleFonts.roboto(
    fontSize: 12.00,
    fontWeight: regular,
    color: AppColor.lightTextGrey,
  );

  static final headerSansTitle = GoogleFonts.openSans(
    fontSize: 18.00,
    fontWeight: _semiBold,
    color: AppColor.textHigh,
  );

  static final headerRobotoTitle = GoogleFonts.roboto(
    fontSize: 18.00,
    fontWeight: _semiBold,
    color: AppColor.textHigh,
  );

  static final semiHeaderRobotoTitle = GoogleFonts.roboto(
    fontSize: 16.00,
    fontWeight: _semiBold,
    color: AppColor.textHigh,
  );

  static final regularRobotoText = GoogleFonts.roboto(
    fontSize: 14.00,
    fontWeight: _regular,
    color: AppColor.textHigh,
  );

  static final semiBoldRobotoText = GoogleFonts.roboto(
      fontSize: 14.00,
      fontWeight: _semiBold,
      color: AppColor.textHigh,
      letterSpacing: 0.32);

  static final smallLightText = GoogleFonts.roboto(
    fontSize: 12.00,
    fontWeight: _regular,
    color: AppColor.nickel,
  );

  static final smallBoldTitle = GoogleFonts.roboto(
    fontSize: 12.00,
    fontWeight: medium,
    color: AppColor.textHigh,
  );

  static final formTitle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: _medium,
  );
  static final textFieldLabel = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: _bold,
  );
  static final textFieldLabel2 = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: _semiBold,
  );
  static final textFieldHintStyle = GoogleFonts.roboto(
    color: AppColor.textLow,
    fontSize: 14,
    fontWeight: _regular,
  );

  //Filter
  static final filterOptionStyle = GoogleFonts.roboto(
    color: AppColor.textLow,
    fontSize: 14,
    fontWeight: _regular,
  );
  static final dateStyle = GoogleFonts.roboto(
    color: AppColor.nickel,
    fontSize: 14,
    fontWeight: _regular,
  );

  static final chipStyle = GoogleFonts.roboto(
      fontStyle: FontStyle.normal,
      fontSize: 8.00,
      fontWeight: _semiBold,
      color: AppColor.white,
      letterSpacing: 0.6);

  // Text button
  static final linkRobotoText = GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: _semiBold,
      color: AppColor.linkBlue,
      letterSpacing: -0.01,
      fontStyle: FontStyle.normal);

  //Error dialog message
  static final errorDialogMessage = GoogleFonts.roboto(
      fontSize: 16.00,
      color: AppColor.lightTextGrey,
      fontWeight: _regular);

  static final mascotTitle = GoogleFonts.roboto(
    fontSize: 12.00,
    color: AppColor.primaryRed,
    fontWeight: _bold,
  );

  static final mascotWithLaptopTitle = GoogleFonts.roboto(
    fontSize: 12.00,
    color: AppColor.darkJungle,
    fontWeight: _bold,
  );

  static final mascotWithLaptopSubTitle = GoogleFonts.roboto(
    fontSize: 12.00,
    color: AppColor.darkJungle,
    fontWeight: _regular,
  );

  static final gestureHandText = GoogleFonts.roboto(
    fontSize: 12.00,
    color: AppColor.darkJungle,
    fontWeight: _medium,
  );

  static final mascotMessage = GoogleFonts.roboto(
      fontSize: 12.00,
      color: AppColor.textHigh,
      fontWeight: regular,
      letterSpacing: 0.3,
      height: 1.3);

  static final previousPolicyHeader = GoogleFonts.roboto(
    fontSize: 16.00,
    color: AppColor.textHigh,
    fontWeight: medium,
  );

  static final forgotPasswordBold = GoogleFonts.roboto(
    fontSize: 24.00,
    color: AppColor.closeIconColor,
    fontWeight: bold,
  );
  static final noWorriesforgotPassword = GoogleFonts.roboto(
    fontSize: 14.00,
    height: 1.4,
    color: AppColor.smokeyGrey,
    fontWeight: regular,
  );
  static final intermediaryCode = GoogleFonts.roboto(
    fontSize: 14.00,
    color: AppColor.textHigh,
    fontWeight: bold,
  );
  static final checkYourEmail = GoogleFonts.roboto(
    fontSize: 24.00,
    color: AppColor.textHigh,
    fontWeight: bold,
  );
  static final sentCredToEmail = GoogleFonts.roboto(
    fontSize: 16.00,
    height: 1.50,
    color: AppColor.smokeyGrey,
    fontWeight: regular,
  );
  static final sentCredToEmailId = GoogleFonts.roboto(
    fontSize: 16.00,
    color: AppColor.closeIconColor,
    fontWeight: medium,
  );
  static final didnotReceiveEmail = GoogleFonts.roboto(
    fontSize: 14.00,
    color: AppColor.smokeyGrey,
    fontWeight: regular,
  );
  static final clickOnResendEmail = GoogleFonts.roboto(
    fontSize: 14.00,
    color: AppColor.linkBlue,
    fontWeight: semiBold,
  );
  static final clickOnResendEmailDisabled = GoogleFonts.roboto(
    fontSize: 14.00,
    color: AppColor.smokeyGrey,
    fontWeight: semiBold,
  );
  static final loginToAms = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColor.white,
  );
  static final appBarStyle = GoogleFonts.roboto(
    fontSize: 20.0,
    fontWeight: semiBold,
    fontStyle: FontStyle.normal,
    color: AppColor.white,
  );
  static final addOnsANdProposalForMotor = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: regular,
    fontStyle: FontStyle.normal,
    color: AppColor.smokeyGrey,
  );
  static final addOnsAndProposalForMotorVal = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: regular,
    fontStyle: FontStyle.normal,
    color: AppColor.textHigh,
  );

  static final endoStyle = GoogleFonts.roboto(
    color: AppColor.darkJungle,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );

  static final webHeaderText1Sans = GoogleFonts.openSans(
    color: AppColor.textHigh,
    fontWeight: FontWeight.w700,
    fontSize: 32.0,
  );

  static final qrTitle = GoogleFonts.openSans(
    color: AppColor.textHigh,
    fontWeight: FontWeight.w700,
    fontSize: 22.0,
  );

  static final qrDescription = GoogleFonts.roboto(
    color: AppColor.lightTextGrey,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    height: 1.5,
  );
}
