import 'package:eigital_task/features/dashboard/widgets/app_navigation_rail.dart';
import 'package:eigital_task/features/guestbook/guestbook_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/dashboard_nav_state.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(dashboardNavIndexProvider);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const AppNavigationRail(),
            const VerticalDivider(width: 1),

            Expanded(
              child: _DashboardBody(selectedIndex: selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  final int selectedIndex;

  const _DashboardBody({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const GuestbookScreen();

      case 1:
      
        return const GuestbookScreen();

      case 2:
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('Bookings Content')),
        );

      case 3:
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('Settings Content')),
        );

      default:
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('Dashboard Content')),
        );
    }
  }
}
