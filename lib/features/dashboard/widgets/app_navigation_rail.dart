import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eigital_task/core/design/colors.dart';
import 'package:eigital_task/core/images/images.dart';
import 'package:eigital_task/core/widgets/custom/asset_svg_returner.dart';
import 'package:eigital_task/features/dashboard/state/dashboard_nav_state.dart';

import '../../guestbook/state/guestbook_controller.dart';

class AppNavigationRail extends ConsumerWidget {
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(dashboardNavIndexProvider);
    final state = ref.watch(guestbookControllerProvider);
    final controller = ref.read(guestbookControllerProvider.notifier);

    return NavigationRail(
      backgroundColor: AppColors.appRailBgColor,
      indicatorColor: AppColors.appRailSelectionColor,
      minWidth: 72,
      selectedIndex: selectedIndex,
      labelType: NavigationRailLabelType.none,
     onDestinationSelected: (index) {
  final navNotifier = ref.read(dashboardNavIndexProvider.notifier);
  final previousIndex = ref.read(dashboardNavIndexProvider);

  navNotifier.state = index;

  if (index == 0 && previousIndex == 0) {
    controller.toggleGuestList();
    return;
  }

  if (index != 0 && !state.isGuestListVisible) {
    controller.showGuestList();
  }
},

      destinations: [
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.menuIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.menuIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Menu'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.eatosIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.eatosIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Guests'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.newOrderIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.newOrderIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Orders'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.table,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.table,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Tables'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.layer1Icon,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.layer1Icon,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Layers'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.chartIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.chartIcon,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Charts'),
        ),
        NavigationRailDestination(
          icon: AssetSvg(
            asset: AppImages.version,
            width: 24,
            height: 24,
            color: AppColors.appRailIconColor,
          ),
          selectedIcon: AssetSvg(
            asset: AppImages.version,
            width: 24,
            height: 24,
            color: AppColors.appRailBgColor,
          ),
          label: const Text('Version'),
        ),
      ],
    );
  }
}
