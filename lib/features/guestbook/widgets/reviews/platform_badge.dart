import 'package:eigital_task/core/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'review_orders.dart';

class PlatformBadge extends StatelessWidget {
  final ReviewPlatform platform;

  const PlatformBadge({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 44.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEDEDED)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: platformIcon(platform),
      ),
    );
  }

  Image platformIcon(ReviewPlatform p) {
    switch (p) {
      case ReviewPlatform.google:
        return Image.asset(AppImages.googleIcon, height: 30,); // replace with real Google icon/svg if you want
      case ReviewPlatform.yelp:
        return Image.asset(AppImages.burstIcon); // placeholder
      case ReviewPlatform.foursquare:
        return Image.asset(AppImages.foursquareIcon); // placeholder
    }
  }

  Color platformColor(ReviewPlatform p) {
    switch (p) {
      case ReviewPlatform.google:
        return const Color(0xFF4285F4);
      case ReviewPlatform.yelp:
        return const Color(0xFFD32323);
      case ReviewPlatform.foursquare:
        return const Color(0xFFF94877);
    }
  }
}
