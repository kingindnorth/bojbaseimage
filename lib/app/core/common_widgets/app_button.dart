//Component with prefix icon

import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_assets.dart';
import 'package:flutter_projects/app/constants/app_color.dart';
import 'package:flutter_projects/app/constants/app_fonts.dart';
import 'package:google_fonts/google_fonts.dart';


class PrefixIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isDisabled;
  final Color textColor, bgColor, borderColor;
  final double textFontSize, borderRadius, width, height;
  final FontWeight textFontWeight;
  final bool isLoading;
  final String text;
  final IconData? prefixIcon;
  final String? assetImage;
  final bool iconWithImage;
  final double? loaderHeight;
  final double? loaderWidth;
  final double? loaderStrikeWidth;
  final Color? loaderColor;
  final double? assetDimension;
  final Color imageIconColor;
  final bool isLeftAligned;
  final Color? iconColor;

  const PrefixIconButton(
      {super.key,
        this.prefixIcon,
        this.isDisabled = false,
        required this.onPressed,
        required this.text,
        this.textColor = Colors.black,
        this.textFontSize = 12,
        required this.bgColor,
        this.borderRadius = 12,
        this.borderColor = AppColor.transparent,
        this.height = 35,
        this.textFontWeight = AppFonts.regular,
        this.isLoading = false,
        required this.width,
        this.iconWithImage = false,
        this.loaderHeight,
        this.loaderWidth,
        this.loaderStrikeWidth,
        this.assetImage,
        this.assetDimension = 16,
        this.loaderColor,
        this.imageIconColor = AppColor.blue,
        this.isLeftAligned = false,
        this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
            side: MaterialStateProperty.all(
              BorderSide(width: 1.0, color: borderColor),
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(bgColor),
            alignment: isLeftAligned ? Alignment.centerLeft : Alignment.center,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(borderRadius))))),
        icon: (prefixIcon == null && assetImage == null) || isLoading
            ? const SizedBox()
            : iconWithImage
            ? Padding(
          padding: EdgeInsets.only(left: isLeftAligned ? 16 : 0),
          child: Image.asset(
            assetImage ?? AppAssets.customerSmallSupportIconGrey,
            height: assetDimension ?? 15,
            width: assetDimension ?? 15,
            color: iconColor ?? imageIconColor,
          ),
        )
            : Padding(
          padding: EdgeInsets.only(left: isLeftAligned ? 16 : 0),
          child: Icon(
            prefixIcon!,
            color: textColor,
            size: textFontSize,
          ),
        ),
        label: isLoading
            ? SizedBox(
          height: loaderHeight ?? 25,
          width: loaderWidth ?? 25,
          child: CircularProgressIndicator(
            strokeWidth: loaderStrikeWidth ?? 4,
            color: loaderColor ?? AppColor.ruddyPink,
          ),
        )
            : Text(
          text,
          style: GoogleFonts.roboto(
              fontWeight: textFontWeight,
              fontSize: textFontSize,
              color: textColor),
        ),
      ),
    );
  }
}
