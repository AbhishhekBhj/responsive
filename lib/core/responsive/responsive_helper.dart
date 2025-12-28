import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelper {
  static double getCurrentScreenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double getCurrentScreenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static Size getCurrentScreenSize({required BuildContext context}){
     return MediaQuery.of(context).size;
  }

  static double getSmartFontSize({
    required double baseSize,
    required BuildContext context,
  }) {
    if (isTabletDevice(context)) {
      if (isLandscape(context)) {
        if (getCurrentScreenWidth(context: context) > 1000) {
          return min(baseSize.sp, (baseSize * 2));
        }
        return min(baseSize.sp, (baseSize * 1.2));
      } else {
        return min(baseSize.sp, (baseSize * 1.1));
      }
     
    } else {

      return baseSize.sp;
    }
  }

  static bool isTabletDevice(BuildContext context) {
    final screenWidth = getCurrentScreenWidth(context: context);
    return screenWidth > 600;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static SizedBox horizontalSpace(double space) {
    return space.horizontalSpace;
  }

  static SizedBox verticalSpace(double space) {
    return SizedBox(height: space.h);
  }
}
