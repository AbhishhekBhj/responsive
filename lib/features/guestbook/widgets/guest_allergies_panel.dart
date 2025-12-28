import 'package:eigital_task/core/design/colors.dart';
import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/core/helpers/common_helpers.dart';
import 'package:eigital_task/core/images/images.dart';
import 'package:eigital_task/core/responsive/adaptive.dart';
import 'package:eigital_task/core/responsive/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_details.dart';
import 'reviews/section_label.dart';

class AllergiesVisitsPanel extends StatelessWidget {
  const AllergiesVisitsPanel({super.key, this.isProfilesOpen});

  final bool? isProfilesOpen;

  @override
  Widget build(BuildContext context) {
    if (isProfilesOpen == true) {
      return Material(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ALLERGIES
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionLabel(text: 'ALLERGIES'),
                  SizedBox(height: 10.h),
                  InfoActionTile(
                    image: AppImages.noAllergies,
                    icon: Icons.restaurant_menu,
                    title: 'No Allergies',
                    actionText: 'Add',
                    onTap: () {
                      // TODO: handle add allergies
                    },
                  ),
                ],
              ),
            ),
        
            SizedBox(width: 16.w),
        
            /// UPCOMING VISITS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionLabel(text: 'UPCOMING VISITS'),
                  SizedBox(height: 10.h),
                  InfoActionTile(
                    image: AppImages.noVisits,
                    icon: Icons.storefront,
                    title: 'No Upcoming Visits',
                    actionText: 'Book A Visit',
                    onTap: () {
                      // TODO: handle book a visit
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [SectionLabel(text: 'ALLERGIES')]),
          SizedBox(height: 10.h),
          InfoActionTile(
                    image: AppImages.noAllergies,

            icon: Icons.restaurant_menu,
            title: 'No Allergies',
            actionText: 'Add',
            onTap: () {
              // TODO: handle add allergies
            },
          ),
          SizedBox(height: 18.h),
          SectionLabel(text: 'UPCOMING VISITS'),
          SizedBox(height: 10.h),
          InfoActionTile(
            icon: Icons.storefront,
                    image: AppImages.noVisits,

            title: 'No Upcoming Visits',
            actionText: 'Book A Visit',
            onTap: () {
              // TODO: handle book a visit
            },
          ),
        ],
      ),
    );
  }
}


class InfoActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String actionText;
  final VoidCallback onTap;

  final String? image;

  const InfoActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.actionText,
    required this.onTap,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveHelper.horizontalSpace(14),


          image!=null

              ? Image.asset(
                  image!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                )
              :

          Icon(icon, size: 24, color: Colors.black87),
          ResponsiveHelper.horizontalSpace(14),

          ThickDivider(),

          SizedBox(width: 14.w),

          Expanded(
            child: Text(
              title,
              style: AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 14),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2B2B2B),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 14.w),
            child: SizedBox(
              height: 64.h,

              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appRailBgColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text(actionText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThickDivider extends StatelessWidget {
  const ThickDivider({super.key, this.thickness = 2.0, this.height = 64.0});

  final double thickness;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: thickness.w,
      height: height.h,
      color: const Color(0xFFE6E6E6),
    );
  }
}
