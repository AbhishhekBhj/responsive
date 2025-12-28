import 'package:eigital_task/core/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewStars extends StatelessWidget {
  final int rating; // 0..5
  final int max;

  const ReviewStars({super.key, required this.rating, this.max = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(max, (index) {
        final filled = index < rating;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Icon(
            Icons.star,
            size: 16,
            color: filled ? const Color(0xFFF4B647) : AppColors.appRailBgColor,
          ),
        );
      }),
    );
  }
}
