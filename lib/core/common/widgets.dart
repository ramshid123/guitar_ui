import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guitar_ui/core/constants/palette.dart';

Widget kText({
  required String text,
  // Color color = ColorConstants.textColor,
  color = ColorConstants.textColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start,
  bool isItalic = false,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      'Poppins',
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontStyle: isItalic?FontStyle.italic:FontStyle.normal,
    ),
  );
}

Widget kHeight(double height) {
  return SizedBox(height: height);
}

Widget kWidth(double width) {
  return SizedBox(width: width);
}
