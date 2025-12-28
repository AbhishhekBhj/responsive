import 'package:eigital_task/core/design/colors.dart';
import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/features/guestbook/widgets/reviews/platform_badge.dart';
import 'package:eigital_task/features/guestbook/widgets/reviews/review_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/common_helpers.dart';
import '../../../../core/responsive/adaptive.dart';
import 'review_stars.dart';

class OnlineReviewCardData {
  final ReviewPlatform platform;
  final int rating; // 0..5
  final String text;

  const OnlineReviewCardData({
    required this.platform,
    required this.rating,
    required this.text,
  });
}

class OnlineReviewCard extends StatelessWidget {
  final OnlineReviewCardData data;

  const OnlineReviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(top: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: const Color(0xFFEDEDED)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(14.w, 28.h, 14.w, 14.h),
              child: Column(
                children: [
                  ReviewStars(rating: data.rating),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: Center(
                      child: Text(
                        data.text,
                        textAlign: TextAlign.center,
                        style: AppTypography.montserrat(
                          fontSize: Adaptive.fontSize(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.appIconColor,
                          height: CommonHelpers.lineHeight(
                            fontSize: 14,
                            figmaLineHeight: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // top badge
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: PlatformBadge(platform: data.platform),
            ),
          ),
        ],
      ),
    );
  }
}
