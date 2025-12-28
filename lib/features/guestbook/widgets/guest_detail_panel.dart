// Guest detail panel

import 'package:eigital_task/features/guestbook/widgets/guest_profile_stats_block.dart' show GuestProfileStatsBlockResponsive;
import 'package:eigital_task/features/guestbook/widgets/notes_panel.dart';
import 'package:eigital_task/features/guestbook/widgets/reviews/review_orders.dart'
    show RecentOrdersAndReviewsPanel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/colors.dart';
import '../../../core/design/typography.dart';
import '../../../core/helpers/common_helpers.dart';
import '../../../core/responsive/adaptive.dart';
import '../../../core/responsive/responsive_helper.dart';
import '../state/guestbook_controller.dart';
import 'guest_allergies_panel.dart';
import 'profile_details.dart';

class GuestDetailPanel extends StatelessWidget {
  final Guest? guest;
  final GuestbookTab selectedTab;
  final ValueChanged<GuestbookTab> onTabSelected;
  final GuestbookState guestbookState;

  const GuestDetailPanel({
    super.key,
    required this.guest,
    required this.selectedTab,
    required this.onTabSelected,
    required this.guestbookState,
  });

  @override
  Widget build(BuildContext context) {

    final bottomInsets = MediaQuery.of(context).padding.bottom;
    if (guest == null) {
      return const Center(child: Text('Select a guest'));
    }

    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: Colors.grey.shade50,
        child: ListView(
          padding:  EdgeInsets.only(bottom: bottomInsets),
          children: [
            Center(
              child: Wrap(
                spacing: 8.sp,
                runSpacing: 8.sp,
                children: [
                  buildTab(context, 'Profile', GuestbookTab.profile),
                  
                  buildTab(context, 'Reservation', GuestbookTab.reservation),
                  buildTab(context, 'Payment', GuestbookTab.payment),
                  buildTab(context, 'Feedback', GuestbookTab.feedback),
                  buildTab(context, 'Order History', GuestbookTab.orderHistory),
                ],
              ),
            ),
            ResponsiveHelper.verticalSpace(12),
      
            // Guest header card
          LayoutBuilder(
        builder: (context, c) {
      final isMobile = c.maxWidth < 600;
      
      final profileBlock = Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              child: 
              
              guest!.image!=null?
              Image.asset(
                guest!.image!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ):
              
              Text(
                CommonHelpers.initialsFromName(guest!.name),
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            ResponsiveHelper.verticalSpace(16),
            Text(
              guest!.name,
              style: AppTypography.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: Adaptive.fontSize(context, 16),
                height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 24),
                color: AppColors.appRailBgColor,
              ),
            ),
            ResponsiveHelper.verticalSpace(8),
            Text(
              guest?.email ?? "",
              style: AppTypography.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: Adaptive.fontSize(context, 14),
                height: CommonHelpers.lineHeight(fontSize: 12, figmaLineHeight: 18),
                color: AppColors.appRailBgColor,
              ),
            ),
            ResponsiveHelper.verticalSpace(8),
            Text(
              guest?.phone ?? "",
              style: AppTypography.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: Adaptive.fontSize(context, 14),
                height: CommonHelpers.lineHeight(fontSize: 12, figmaLineHeight: 16),
                color: AppColors.appRailBgColor,
              ),
            ),
          ],
        ),
      );
      
      if (!isMobile) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileBlock,
            const VerticalDivider(),
            const Expanded(child: GuestProfileStatsBlock()),
          ],
        );
      }
      
      // Mobile: stack
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: profileBlock),
          const SizedBox(height: 12),
          const GuestProfileStatsBlockResponsive(),
        ],
      );
        },
      ),
      
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child:  AllergiesVisitsPanel(
                isProfilesOpen: guestbookState.isGuestListVisible,
              ),
            ),
      
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: const NotesPanel(),
              ),
            ),
      
            RecentOrdersAndReviewsPanel(),
          ],
        ),
      ),
    );
  }

  Widget buildTab(BuildContext context, String label, GuestbookTab tab) {
    final isSelected = selectedTab == tab;

    return GestureDetector(
     
      onTap: () => onTabSelected(tab),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.appIconColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Text(
          label,
          style: AppTypography.montserrat(
            fontSize: Adaptive.fontSize(context, 16),
            height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 20),
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
