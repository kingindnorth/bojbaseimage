//csshetty
import 'package:flutter/material.dart';
import 'package:flutter_projects/app/constants/app_string.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String newText;
  final textColor;
  final textFontFamily;
  final textFontSize;
  final textFontWeight;
  final textFontStyle;
  final margin;
  final padding;
  final lineHeight;
  final double? letterSpacing;
  final newTextAlign;
  final newWidth, newHeight;
  final newMaxLine;
  final toolTip;
  final softWrap, overFlow, haveConstraints, underLine;
  final minWidth, maxWidth, minHeight, maxHeight;
  final isCurrency;

  const AppText(
      {Key? key,
        required this.newText,
        this.textColor,
        required this.textFontSize,
        this.textFontWeight = FontWeight.w600,
        this.margin,
        this.newTextAlign,
        this.newWidth,
        this.padding,
        this.newHeight,
        this.softWrap,
        this.lineHeight,
        this.newMaxLine,
        this.toolTip,
        this.letterSpacing,
        this.textFontFamily = '',
        this.textFontStyle = FontStyle.normal,
        this.overFlow = true,
        this.minWidth = 200.00,
        this.maxWidth = 350.00,
        this.maxHeight = 500.00,
        this.minHeight = 10.00,
        this.haveConstraints = false,
        this.underLine = false,
        this.isCurrency = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: newWidth,
        height: newHeight,
        padding: padding,
        constraints: haveConstraints
            ? BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight)
            : null,
        child: this.toolTip != null
            ? Tooltip(message: toolTip, child: textData())
            : textData());
  }

  textData() {
    return Text(
      isCurrency ? '\u{20B9}$newText' : newText,
      textAlign: newTextAlign,
      overflow: overFlow ? TextOverflow.ellipsis : null,
      maxLines: newMaxLine,
      style: textFontFamily == AppString.fontFamilyOpenSans
          ? GoogleFonts.openSans(
          height: lineHeight,
          color: textColor,
          fontWeight: textFontWeight,
          fontSize: double.tryParse(textFontSize.toString()),
          // fontSize:textFontSize,
          fontStyle: textFontStyle,
          letterSpacing: letterSpacing,
          decoration:
          underLine ? TextDecoration.underline : TextDecoration.none)
          : GoogleFonts.roboto(
          height: lineHeight,
          color: textColor,
          fontWeight: textFontWeight,
          fontSize: double.tryParse(textFontSize.toString()),
          // fontSize:textFontSize,

          fontStyle: textFontStyle,
          letterSpacing: letterSpacing,
          decoration:
          underLine ? TextDecoration.underline : TextDecoration.none),
      // TextStyle(
      //   height: lineHeight,
      //   color: textColor,
      //   fontFamily: textFontFamily,
      //   fontWeight: textFontWeight,
      //   fontSize: textFontSize,
      //   fontStyle: textFontStyle,
      //   letterSpacing: letterSpacing,
      //   decoration:
      //       underLine ? TextDecoration.underline : TextDecoration.none),
      softWrap: softWrap,
    );
  }
}
