import 'package:flutter/material.dart';

import '../../../core/design/colors.dart';
import '../../../core/design/typography.dart';
import '../../../core/helpers/common_helpers.dart';
import '../../../core/responsive/adaptive.dart';
import '../../../core/responsive/responsive_helper.dart';

class GuestProfileStatsBlockResponsive extends StatelessWidget {
  const GuestProfileStatsBlockResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final isMobile = w < 600;

        return Material(
            color: Colors.white,
          child: Column(
            children: [
              TopMetricsCardResponsive(isMobile: isMobile),
              const SizedBox(height: 16),
              MiddleCardsResponsive(isMobile: isMobile),
              const SizedBox(height: 16),
              BottomEmptyStatesResponsive(isMobile: isMobile),
            ],
          ),
        );
      },
    );
  }
}

/// =======================
/// Top metrics
/// Tablet+: 5 columns row
/// Mobile: Wrap (2 per row)
/// =======================
class TopMetricsCardResponsive extends StatelessWidget {
  final bool isMobile;
  const TopMetricsCardResponsive({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final items = const [
      MetricItem(value: '-- -- --', label: 'Last Visit'),
      MetricItem(value: r'$0.00', label: 'Average Spend'),
      MetricItem(value: r'$0.00', label: 'Lifetime Spend'),
      MetricItem(value: '0', label: 'Total Orders'),
      MetricItem(value: r'$0.00', label: 'Average Tip'),
    ];

    if (!isMobile) {
      return SurfaceCard(
        child: Row(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              Expanded(child: MetricTile(item: items[i])),
              if (i != items.length - 1) const CardVDivider(height: 70),
            ],
          ],
        ),
      );
    }

    // Mobile: 2 columns wrap, better readability
    return SurfaceCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final item in items)
              SizedBox(
                width: (MediaQuery.of(context).size.width - 16 * 2 - 12 * 1) / 2,
                child: MetricTile(item: item, compact: true),
              ),
          ],
        ),
      ),
    );
  }
}

class MetricItem {
  final String value;
  final String label;
  const MetricItem({required this.value, required this.label});
}

class MetricTile extends StatelessWidget {
  final MetricItem item;
  final bool compact;

  const MetricTile({
    super.key,
    required this.item,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 14,
        vertical: compact ? 10 : 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.montserrat(
              fontSize: Adaptive.fontSize(context, compact ? 14 : 16),
              fontWeight: FontWeight.w700,
              color: AppColors.appRailBgColor,
              height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 24),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.montserrat(
              fontSize: Adaptive.fontSize(context, compact ? 11 : 12),
              fontWeight: FontWeight.w500,
              color: AppColors.appRailBgColor,
              height: CommonHelpers.lineHeight(fontSize: 12, figmaLineHeight: 18),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// Middle row
/// Tablet+: 3 cards row
/// Mobile: stack vertically
/// =======================
class MiddleCardsResponsive extends StatelessWidget {
  final bool isMobile;
  const MiddleCardsResponsive({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final loyalty = TwoByTwoStatCard(
      title: 'LOYALTY',
      items: const [
        StatItem(value: '0', label: 'Earned'),
        StatItem(value: '0', label: 'Redeemed'),
        StatItem(value: '0', label: 'Available'),
        StatItem(value: r'$ 00.00', label: 'Amount'),
      ],
    );

    final visits = TwoByTwoStatCard(
      title: 'VISITS',
      items: const [
        StatItem(value: '0', label: 'Total Visits'),
        StatItem(value: '0', label: 'Upcoming'),
        StatItem(value: '0', label: 'Canceled'),
        StatItem(value: '0', label: 'No Shows'),
      ],
    );

    final loyaltyForm = const LoyaltyFormCard();

    if (!isMobile) {
      return Row(
        children: [
          const Expanded(flex: 3, child: LoyaltyFormCard()),
          const SizedBox(width: 14),
          Expanded(flex: 4, child: loyalty),
          const SizedBox(width: 14),
          Expanded(flex: 4, child: visits),
        ],
      );
    }

    // Mobile: stack
    return Column(
      children: [
        loyaltyForm,
        const SizedBox(height: 14),
        loyalty,
        const SizedBox(height: 14),
        visits,
      ],
    );
  }
}

class LoyaltyFormCard extends StatelessWidget {
  const LoyaltyFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    final muted = Colors.black.withOpacity(0.55);

    return SurfaceCard(
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
            const FormRow(label: 'Since', hintText: 'Enter'),
            const Divider(height: 1),
            const FormRow(label: 'Birthday', hintText: 'Enter', trailingIcon: Icons.cake_outlined),
            const Divider(height: 1),
            const FormRow(label: 'Anniversary', hintText: 'Enter', trailingIcon: Icons.emoji_events_outlined),
          ],
        ),
      ),
    );
  }
}

class FormRow extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? trailingIcon;

  const FormRow({
    super.key,
    required this.label,
    required this.hintText,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black.withOpacity(0.55),
          fontWeight: FontWeight.w400,
        );
    final hintStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black.withOpacity(0.25),
          fontWeight: FontWeight.w500,
        );

    return Material(
        color: Colors.white,
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            Text(label, style: labelStyle),
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              Icon(trailingIcon, size: 16, color: AppColors.appRailBgColor),
            ],
            const Spacer(),
            SizedBox(
              width: 120,
              child: TextFormField(
                textAlign: TextAlign.right,
                style: hintStyle,
                initialValue: hintText,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoByTwoStatCard extends StatelessWidget {
  final String title;
  final List<StatItem> items;

  const TwoByTwoStatCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 14),
                fontWeight: FontWeight.w600,
                color: AppColors.appTwoRowHeadingColor,
                height: CommonHelpers.lineHeight(fontSize: 14, figmaLineHeight: 20),
              ),
            ),
            ResponsiveHelper.verticalSpace(12),
            TwoByTwoGrid(items: items),
          ],
        ),
      ),
    );
  }
}

class StatItem {
  final String value;
  final String label;
  const StatItem({required this.value, required this.label});
}

class TwoByTwoGrid extends StatelessWidget {
  final List<StatItem> items;
  const TwoByTwoGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTypography.montserrat(
      fontSize: Adaptive.fontSize(context, 11),
      fontWeight: FontWeight.w500,
      color: AppColors.appRailBgColor,
      height: CommonHelpers.lineHeight(fontSize: 11, figmaLineHeight: 18),
    );
    final valueStyle = AppTypography.montserrat(
      fontSize: Adaptive.fontSize(context, 16),
      fontWeight: FontWeight.w600,
      color: AppColors.appRailBgColor,
      height: CommonHelpers.lineHeight(fontSize: 16, figmaLineHeight: 24),
    );

    return SizedBox(
      height: 132,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: StatCell(item: items[0], valueStyle: valueStyle, labelStyle: labelStyle)),
                const InnerVDivider(),
                Expanded(child: StatCell(item: items[1], valueStyle: valueStyle, labelStyle: labelStyle)),
              ],
            ),
          ),
          const InnerHDivider(),
          Expanded(
            child: Row(
              children: [
                Expanded(child: StatCell(item: items[2], valueStyle: valueStyle, labelStyle: labelStyle)),
                const InnerVDivider(),
                Expanded(child: StatCell(item: items[3], valueStyle: valueStyle, labelStyle: labelStyle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatCell extends StatelessWidget {
  final StatItem item;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;

  const StatCell({
    super.key,
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
/// Bottom empty states
/// Tablet+: 2 in a row
/// Mobile: stack
/// =======================
class BottomEmptyStatesResponsive extends StatelessWidget {
  final bool isMobile;
  const BottomEmptyStatesResponsive({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final left = const EmptyPill(
      icon: Icons.storefront_outlined,
      label: 'No Ordered Items',
    );

    final right = const EmptyPill(
      icon: Icons.directions_car_filled_outlined,
      label: 'No Recent Vehicle To Show',
    );

    if (!isMobile) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(child: EmptyPill(icon: Icons.storefront_outlined, label: 'No Ordered Items')),
          SizedBox(width: 14),
          Expanded(child: EmptyPill(icon: Icons.directions_car_filled_outlined, label: 'No Recent Vehicle To Show')),
        ],
      );
    }

    return Column(
      children: [
        left,
        const SizedBox(height: 14),
        right,
      ],
    );
  }
}

class EmptyPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const EmptyPill({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
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
/// Shared primitives
/// =======================
class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;

  const SurfaceCard({
    super.key,
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

class CardVDivider extends StatelessWidget {
  final double height;
  const CardVDivider({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: height, color: Colors.black.withOpacity(0.08));
  }
}

class InnerVDivider extends StatelessWidget {
  const InnerVDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, color: Colors.black.withOpacity(0.08));
  }
}

class InnerHDivider extends StatelessWidget {
  const InnerHDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Colors.black.withOpacity(0.08));
  }
}
