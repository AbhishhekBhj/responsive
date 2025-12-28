import 'package:flutter/material.dart';

import '../state/guestbook_controller.dart';
import 'guest_detail_panel.dart';
import '../guestbook_screen.dart'; 

class GuestbookDetailColumn extends StatelessWidget {
  final GuestbookState guestbookState;

  final Guest? selectedGuest;

  final GuestbookTab selectedTab;

  final bool showBack;

  final String title;
  final String subtitle;

  final VoidCallback onBack;
  final VoidCallback onHideGuestList;
  final ValueChanged<GuestbookTab> onTabSelected;

  const GuestbookDetailColumn({
    super.key,
    required this.guestbookState,
    required this.selectedGuest,
    required this.selectedTab,
    required this.showBack,
    required this.title,
    required this.subtitle,
    required this.onBack,
    required this.onHideGuestList,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onHideGuestList,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: GuestbookTopBar(
              showBack: showBack,
              onBack: onBack,
              title: title,
              subtitle: subtitle,
            ),
          ),
          Expanded(
            flex: 9,
            child: GuestDetailPanel(
              guestbookState: guestbookState,
              guest: selectedGuest,
              selectedTab: selectedTab,
              onTabSelected: onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}
