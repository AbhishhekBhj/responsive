import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/core/helpers/common_helpers.dart';
import 'package:eigital_task/core/responsive/responsive_helper.dart';
import 'package:flutter/material.dart';

import '../../../core/design/colors.dart';
import '../../../core/responsive/adaptive.dart';

class GuestProfileStatsBlock extends StatelessWidget {
  const GuestProfileStatsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopMetricsCard(),
        SizedBox(height: 16),
        _MiddleCardsRow(),
        SizedBox(height: 16),
        _BottomEmptyStatesRow(),
      ],
    );
  }
}

/// =======================
/// Top metrics (5 columns)
/// =======================
class _TopMetricsCard extends StatelessWidget {
  const _TopMetricsCard();

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      child: Row(
        children: const [
          Expanded(child: _MetricTile(value: '-- -- --', label: 'Last Visit')),
          VDivider(),
          Expanded(child: _MetricTile(value: r'$0.00', label: 'Average Spend')),
          VDivider(),
          Expanded(child: _MetricTile(value: r'$0.00', label: 'Lifetime Spend')),
          VDivider(),
          Expanded(child: _MetricTile(value: '0', label: 'Total Orders')),
          VDivider(),
          Expanded(child: _MetricTile(value: r'$0.00', label: 'Average Tip')),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String value;
  final String label;

  const _MetricTile({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
   
  

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTypography.montserrat(
            fontSize: Adaptive.fontSize(context, 16),
            fontWeight: FontWeight.w700,
            color: AppColors.appRailBgColor,
            height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 24)
          )),
          const SizedBox(height: 10),
          Text(label,  style: AppTypography.montserrat(
            fontSize: Adaptive.fontSize(context, 12),
            fontWeight: FontWeight.w500,
            color: AppColors.appRailBgColor,
            height: CommonHelpers.lineHeight(fontSize: 12, figmaLineHeight: 18)
          )),
        ],
      ),
    );
  }
}

/// =======================
/// Middle row (3 cards)
/// =======================
class _MiddleCardsRow extends StatelessWidget {
  const _MiddleCardsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 3, child: _LoyaltyFormCard()),
       
        Expanded(flex: 4, child: _TwoByTwoStatCard(title: 'LOYALTY', items: [
          _StatItem(value: '0', label: 'Earned'),
          _StatItem(value: '0', label: 'Redeemed'),
          _StatItem(value: '0', label: 'Available'),
          _StatItem(value: r'$ 00.00', label: 'Amount'),
        ])),
        SizedBox(width: 14),
        Expanded(flex: 4, child: _TwoByTwoStatCard(title: 'VISITS', items: [
          _StatItem(value: '0', label: 'Total Visits'),
          _StatItem(value: '0', label: 'Upcoming'),
          _StatItem(value: '0', label: 'Canceled'),
          _StatItem(value: '0', label: 'No Shows'),
        ])),
      ],
    );
  }
}

/// Left card: "Loyalty / RFI" + 3 rows
class _LoyaltyFormCard extends StatelessWidget {
  const _LoyaltyFormCard();

  @override
  Widget build(BuildContext context) {
    final muted = Colors.black.withOpacity(0.55);

    return _SurfaceCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Loyalty',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: muted,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                Text(
                  'RFI',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.black.withOpacity(0.08), height: 1),

            const SizedBox(height: 10),
            const _FormRow(label: 'Since', trailing: 'Enter'),
            const _HDivider(),
            const _FormRow(label: 'Birthday', trailing: 'Enter', trailingIcon: Icons.cake_outlined),
            const _HDivider(),
            const _FormRow(label: 'Anniversary', trailing: 'Enter', trailingIcon: Icons.emoji_events_outlined),
          ],
        ),
      ),
    );
  }
}

class _FormRow extends StatelessWidget {
  final String label;
  final String trailing;
  final IconData? trailingIcon;

  const _FormRow({
    required this.label,
    required this.trailing,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black.withOpacity(0.55),
          fontWeight: FontWeight.w400,
        );
    final trailingStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black.withOpacity(0.18),
          fontWeight: FontWeight.w500,
        );

    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Text(label, style: labelStyle),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(trailingIcon, size: 16, color: AppColors.appRailBgColor),
          ],
          

          Expanded(child: TextFormField(
            textAlign: TextAlign.right,
            initialValue: trailing,
            style: trailingStyle,
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            
          ))
          
        ],
      ),
    );
  }
}

/// Middle/right cards: 2×2 grid with dividers
class _TwoByTwoStatCard extends StatelessWidget {
  final String title;
  final List<_StatItem> items;

  const _TwoByTwoStatCard({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
  

    return _SurfaceCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: 
              AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 14),
                fontWeight: FontWeight.w600,
                color: AppColors.appTwoRowHeadingColor,
                height: CommonHelpers.lineHeight(fontSize: 14, figmaLineHeight: 20)
              ),
            ),
            ResponsiveHelper.verticalSpace(12),
          
            _TwoByTwoGrid(items: items),
          ],
        ),
      ),
    );
  }
}

class _StatItem {
  final String value;
  final String label;

  const _StatItem({
    required this.value,
    required this.label,
  });
}

class _TwoByTwoGrid extends StatelessWidget {
  final List<_StatItem> items;

  const _TwoByTwoGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 11),
                fontWeight: FontWeight.w500,
                color: AppColors.appRailBgColor,
                height: CommonHelpers.lineHeight(fontSize: 11, figmaLineHeight: 18)
              );
    final valueStyle = AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 16),
                fontWeight: FontWeight.w600,
                color: AppColors.appRailBgColor,
                height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 24)
              );

    // Layout: two columns, two rows, with inner dividers.
    return Container(
    
      height: 132,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _StatCell(item: items[0], valueStyle: valueStyle, labelStyle: labelStyle)),
                const _InnerVDivider(),
                Expanded(child: _StatCell(item: items[1], valueStyle: valueStyle, labelStyle: labelStyle)),
              ],
            ),
          ),
          const _InnerHDivider(),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _StatCell(item: items[2], valueStyle: valueStyle, labelStyle: labelStyle)),
                const _InnerVDivider(),
                Expanded(child: _StatCell(item: items[3], valueStyle: valueStyle, labelStyle: labelStyle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  final _StatItem item;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;

  const _StatCell({
    required this.item,
    required this.valueStyle,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.value, style: valueStyle),
          const SizedBox(height: 10),
          Text(item.label, style: labelStyle),
        ],
      ),
    );
  }
}

/// =======================
/// Bottom empty states row
/// =======================
class _BottomEmptyStatesRow extends StatelessWidget {
  const _BottomEmptyStatesRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: _EmptyPill(
            icon: Icons.storefront_outlined,
            label: 'No Ordered Items',
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: _EmptyPill(
            icon: Icons.directions_car_filled_outlined,
            label: 'No Recent Vehicle To Show',
          ),
        ),
      ],
    );
  }
}

class _EmptyPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _EmptyPill({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      radius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: Colors.black.withOpacity(0.55)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.75),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// Shared UI primitives
/// =======================
class _SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;

  const _SurfaceCard({
    required this.child,
    this.padding,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: child,
    );
  }
}

class VDivider extends StatelessWidget {
  const VDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 70,
      color: Colors.black.withOpacity(0.08),
    );
  }
}

class _InnerVDivider extends StatelessWidget {
  const _InnerVDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: Colors.black.withOpacity(0.08),
    );
  }
}

class _InnerHDivider extends StatelessWidget {
  const _InnerHDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.black.withOpacity(0.08),
    );
  }
}

class _HDivider extends StatelessWidget {
  const _HDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.black.withOpacity(0.08), height: 1);
  }
}
