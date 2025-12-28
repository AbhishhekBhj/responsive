import 'package:flutter/material.dart';

class Adaptive {
  Adaptive._();

  /// assumed breakpoints for devices
  static const double phoneMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  /// device type checks
  static bool isPhone(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < phoneMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= phoneMaxWidth && width < tabletMaxWidth;
  }

  static bool isLargeTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= tabletMaxWidth;
  }

  /// Return value based on breakpoint
  static T value<T>({
    required BuildContext context,
    required T phone,
    T? tablet,
    T? largeTablet,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= tabletMaxWidth && largeTablet != null) {
      return largeTablet;
    }

    if (width >= phoneMaxWidth && tablet != null) {
      return tablet;
    }

    return phone;
  }

  /// Responsive font size with clamped scaling
  /// 
  /// 
  static double fontSize(
    BuildContext context,
    double base, {
    double minScale = 0.9,
    double maxScale = 1.15,
  }) {
    final scale = MediaQuery.textScaleFactorOf(context)
        .clamp(minScale, maxScale);

    return base * scale;
  }

  /// Common horizontal padding by device
  static double horizontalPadding(BuildContext context) {
    return value(
      context: context,
      phone: 16,
      tablet: 24,
      largeTablet: 32,
    );
  }

  /// Guest list panel width
  static double guestListWidth(BuildContext context) {
    return value(
      context: context,
      phone: 0,
      tablet: 320,
      largeTablet: 360,
    );
  }

  /// Max width for detail content (prevents over-stretching)
  static double contentMaxWidth(BuildContext context) {
    return value(
      context: context,
      phone: double.infinity,
      tablet: 900,
      largeTablet: 1100,
    );
  }

  
}
