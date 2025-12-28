import 'package:flutter/material.dart';

import '../../../../core/design/colors.dart';
import '../../../../core/design/typography.dart';
import '../../../../core/helpers/common_helpers.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../profile_details.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDivider(),
        ResponsiveHelper.horizontalSpace(14),
        Text(
          text,
          style: Adaptive.isPhone(context)
              ? AppTypography.montserrat(
                  fontSize: Adaptive.fontSize(context, 14),
                  height: CommonHelpers.lineHeight(fontSize: 14, figmaLineHeight: 16),
                  fontWeight: FontWeight.w600,
                                   color: AppColors.appTwoRowHeadingColor

                )
              : AppTypography.montserrat(
                  fontSize: Adaptive.fontSize(context, 16),
                  height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.appTwoRowHeadingColor
              )
        ),
      ],
    );
  }
}
