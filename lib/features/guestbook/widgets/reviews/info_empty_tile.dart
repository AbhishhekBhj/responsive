import 'package:eigital_task/features/guestbook/widgets/guest_allergies_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/typography.dart';
import '../../../../core/responsive/adaptive.dart';

class InfoEmptyTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const InfoEmptyTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
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
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(width: 14.w),
            Icon(icon, size: 24, color: const Color(0xFF2B2B2B)),
            SizedBox(width: 14.w),
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
            SizedBox(width: 14.w),
          ],
        ),
      ),
    );
  }
}
