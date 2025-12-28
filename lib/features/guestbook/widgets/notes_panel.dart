import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/core/helpers/common_helpers.dart';
import 'package:eigital_task/features/guestbook/widgets/guest_allergies_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/responsive/adaptive.dart';
import 'reviews/section_label.dart';

class NotesPanel extends StatelessWidget {
  const NotesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(text: 'NOTES'),
        SizedBox(height: 10.h),
        Container(
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
          child: Column(
            children: [
              NoteRow(
                icon: Icons.receipt_long,
                title: 'General',
                subtitle: 'Add notes',
                onTap: () {
                  // TODO: open General notes
                },
              ),
              NoteDivider(),
              NoteRow(
                icon: Icons.star_border,
                title: 'Special Relation',
                subtitle: 'Add notes',
                onTap: () {},
              ),
              NoteDivider(),
              NoteRow(
                icon: Icons.event_seat,
                title: 'Seating Preferences',
                subtitle: 'Add notes',
                onTap: () {},
              ),
              NoteDivider(),
              NoteRow(
                icon: Icons.note_alt_outlined,
                title: 'Special Note*',
                subtitle: 'Add notes',
                onTap: () {},
              ),
              NoteDivider(),
              NoteRow(
                icon: Icons.restaurant_menu,
                title: 'Allergies',
                subtitle: 'Add notes',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NoteRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const NoteRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // 🔥 important
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Icon(
                      icon,
                      size: 20,
                      color: const Color(0xFF2B2B2B),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTypography.montserrat(
                        fontSize: Adaptive.fontSize(context, 16),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2B2B2B),
                        height: CommonHelpers.lineHeight(
                          fontSize: 16,
                          figmaLineHeight: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              TextFormField(
                 decoration:  InputDecoration.collapsed(
      hintText: subtitle,
      hintStyle: AppTypography.montserrat(
        fontSize: Adaptive.fontSize(context, 14),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF85858B),
        height: CommonHelpers.lineHeight(
          fontSize: 14,
          figmaLineHeight: 20,
        ),
      ),
        ),
                
                style: AppTypography.montserrat(
                  fontSize: Adaptive.fontSize(context, 14),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF85858B),
                  height: CommonHelpers.lineHeight(
                    fontSize: 14,
                    figmaLineHeight: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteDivider extends StatelessWidget {
  const NoteDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: const Color(0xFFEDEDED),
      indent: 14.w,
      endIndent: 14.w,
    );
  }
}


