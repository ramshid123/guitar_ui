import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_ui/core/common/widgets.dart';
import 'package:guitar_ui/core/constants/palette.dart';

class HomePageWidget {
  static Widget drawerButton({required String text, bool isSelected = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: kText(
        text: text,
        color: isSelected ? ColorConstants.redColor : ColorConstants.textColor,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget drawerInfoText({required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: kText(
        text: text,
        color: ColorConstants.textColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget drawerIcon() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Transform.translate(
          offset: Offset(-10.w, 0),
          child: Container(
            height: 50.r,
            width: 50.r,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.brown.withOpacity(0.5),
                width: 5.r,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.drawerColor,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: kText(
            text: 'STRING',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.brown,
            isItalic: true,
          ),
        ),
      ],
    );
  }
}
