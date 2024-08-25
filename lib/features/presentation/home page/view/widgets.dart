import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_ui/core/common/widgets.dart';
import 'package:guitar_ui/core/constants/palette.dart';

class HomePageWidget {
  static Widget text3D({
    required int layerCount,
    required String text,
    TextStyle textStyle = const TextStyle(),
    double heightFromSurface = 0,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            color: Colors.transparent,
            shadows: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.5),
                offset: const Offset(0, 0),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        for (int i = 0; i < layerCount; i++)
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0, (i * 0.5) + heightFromSurface.h),
            child: Text(
              text,
              style: textStyle,
            ),
          ),
      ],
    );
  }

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

  static Widget guitarWidget() {
    const heigthFromSurface = 10;
    return Transform.translate(
      offset: Offset(0.0, -30.h),
      child: Transform.scale(
        scale: 1.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 400.h,
              width: 100.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 40,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 30; i++)
              Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0, (0.5 * i) + heigthFromSurface)
                  ..rotateY(math.pi * -0.02),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateY((math.pi / 360) *
                        (-0.5 + (i - 0) * (0.5 - (-0.5)) / (29 - 0))),
                  child: Image.asset(
                    'assets/guitar body.png',
                    height: 400.h,
                  ),
                ),
              ),
            for (int i = 0; i < 10; i++)
              Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0, (15.r + (0.5 * i)) + heigthFromSurface)
                  ..rotateY(math.pi * -0.02),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateY((math.pi / 360) *
                        (-0.5 + (i - 0) * (0.5 - (-0.5)) / (9 - 0))),
                  child: Image.asset(
                    'assets/guitar body with handle.png',
                    height: 400.h,
                  ),
                ),
              ),
            for (int i = 0; i < 10; i++)
              Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0, (20.r + (0.5 * i)) + heigthFromSurface)
                  ..rotateY(math.pi * -0.02),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateY((math.pi / 360) *
                        (-0.5 + (i - 0) * (0.5 - (-0.5)) / (9 - 0))),
                  child: Image.asset(
                    'assets/guitar handle.png',
                    height: 400.h,
                  ),
                ),
              ),
            for (int i = 0; i < 8; i++)
              Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0, (25.r + (0.2 * i)) + heigthFromSurface)
                  ..rotateY(math.pi * -0.02),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateY((math.pi / 360) *
                        (-0.5 + (i - 0) * (0.5 - (-0.5)) / (7 - 0))),
                  child: Image.asset(
                    'assets/guitar string.png',
                    height: 400.h,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
