import 'package:eigital_task/core/consts/app_consts.dart';
import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/core/helpers/common_helpers.dart';
import 'package:eigital_task/core/responsive/adaptive.dart';
import 'package:eigital_task/core/responsive/responsive_helper.dart';
import 'package:eigital_task/core/widgets/custom/asset_svg_returner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/colors.dart';
import '../../core/images/images.dart';
import 'state/guestbook_controller.dart';
import 'widgets/guest_detail_panel.dart';
import 'widgets/guest_list_panel.dart';
import 'widgets/guestbook_details_column.dart';

class GuestbookScreen extends ConsumerWidget {
  const GuestbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(guestbookControllerProvider);
    final controller = ref.read(guestbookControllerProvider.notifier);

    final listItems = state.guests
        .map(
          (g) => GuestListItem(
            id: g.id,
            name: g.name,
            email: g.email,
            phone: g.phone,
            image: g.image,
            isVip: false,
          ),
        )
        .toList();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                width: state.isGuestListVisible ? 340 : 0,
                child: state.isGuestListVisible
                    ? GuestListPanel(
                        guestSort: state.sort,
                        onSortTap: controller.toggleSortByName,
                        guests: listItems,
                        selectedGuestId: state.selectedGuest?.id,
                        onGuestSelected: (id) {
                          controller.selectGuestById(id);
                          if (Adaptive.isPhone(context)) {


                            CommonHelpers.navigateWithAnimation(context: context, page:Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(guestbookControllerProvider);
        final controller = ref.read(guestbookControllerProvider.notifier);

        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: GuestbookDetailColumn(
              guestbookState: state,
              selectedGuest: state.selectedGuest,
              selectedTab: state.selectedTab,
              showBack: true,
              title: 'Guest Book',
              subtitle: AppConsts.guestBookScreenSubTitle,
              onBack: () => Navigator.of(context).pop(),
              onHideGuestList: () {}, 
              onTabSelected: controller.selectTab,
            ),
          ),
        );
      },
    )
  );



                           
                           
                          }
                        },
                      )
                    : const SizedBox.shrink(),
              ),


              if(!Adaptive.isPhone(context))

              Expanded(
                child: GuestbookDetailColumn(
                  guestbookState: state,
                  selectedGuest: state.selectedGuest,
                  selectedTab: state.selectedTab,
                  showBack: !state.isGuestListVisible,
                  title: 'Guest Book',
                  subtitle: AppConsts.guestBookScreenSubTitle,
                  onBack: controller.showGuestList,
                  onHideGuestList: controller.hideGuestList,
                  onTabSelected: controller.selectTab,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Top bar with the required "back to expand" behavior.
class GuestbookTopBar extends StatelessWidget {
  final bool showBack;
  final VoidCallback onBack;
  final String title;
  final String subtitle;

  const GuestbookTopBar({
    super.key,
    required this.showBack,
    required this.onBack,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBack)
              IconButton(
                onPressed: onBack,
                icon: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.appIconColor,
                      size: 16,
                    ),
                    Text(
                      "Guest Book",
                      style: AppTypography.montserrat(
                        fontSize: Adaptive.fontSize(context, 16),
                        fontWeight: FontWeight.w600,
                        color: AppColors.appIconColor,
                      ),
                    ),
                  ],
                ),
                tooltip: 'Show guest list',
              ),
      
            ResponsiveHelper.horizontalSpace(8),
      
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AssetSvg(asset: AppImages.guestBookIcon),
                  ResponsiveHelper.verticalSpace(12),
                  Text(
                    title,
                    style: AppTypography.montserrat(
                      fontSize: Adaptive.fontSize(context, 16),
                      fontWeight: FontWeight.w700,
                      height: CommonHelpers.lineHeight(
                        fontSize: 16,
                        figmaLineHeight: 24,
                      ),
                    ),
                  ),
                  ResponsiveHelper.verticalSpace(2),
      
                  Text(
                    subtitle,
      
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.montserrat(
                      fontWeight: FontWeight.w400,
                      height: CommonHelpers.lineHeight(
                        fontSize: 16,
                        figmaLineHeight: 24,
                      ),
                      fontSize: Adaptive.fontSize(context, 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
