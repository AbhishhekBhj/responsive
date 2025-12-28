// Guest list panel

import 'package:eigital_task/core/design/typography.dart';
import 'package:eigital_task/core/helpers/common_helpers.dart';
import 'package:eigital_task/core/images/images.dart';
import 'package:eigital_task/core/widgets/custom/asset_svg_returner.dart';
import 'package:eigital_task/features/guestbook/widgets/guest_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/colors.dart';
import '../../../core/responsive/adaptive.dart';
import '../../../core/responsive/responsive_helper.dart';
import '../state/guestbook_controller.dart';

class GuestListItem {
  final String id;
  final String name;
  final String email;
  final String phone;
  final bool isVip;
  final String? image;

  const GuestListItem({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.isVip = false,
  });
}

class GuestListPanel extends StatefulWidget {
  final List<GuestListItem> guests;
  final String? selectedGuestId;
  final ValueChanged<String> onGuestSelected;
  final VoidCallback onSortTap;
  final GuestSort guestSort;

  const GuestListPanel({
    super.key,
    required this.guests,
    required this.selectedGuestId,
    required this.onGuestSelected,
    required this.onSortTap,
    required this.guestSort,
  });

  @override
  State<GuestListPanel> createState() => _GuestListPanelState();
}

class _GuestListPanelState extends State<GuestListPanel> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = widget.guests.where((g) {
      if (_query.trim().isEmpty) return true;
      final q = _query.toLowerCase();
      return g.name.toLowerCase().contains(q) ||
          g.email.toLowerCase().contains(q) ||
          g.phone.contains(q);
    }).toList();

    return Container(
      padding: EdgeInsets.only(left: 28.sp),

      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.appIconColor,
                size: 16,
              ),
              ResponsiveHelper.horizontalSpace(10),
              Text(
                "Settings",

                textAlign: TextAlign.left,

                style: AppTypography.montserrat(
                  fontSize: Adaptive.fontSize(context, 22),

                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textFieldColor,
                ),
              ),
            ],
          ),

          ResponsiveHelper.verticalSpace(25),

          // Search field
          TextFormField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: AppTypography.montserrat(
                fontSize: Adaptive.fontSize(context, 16),
                fontWeight: FontWeight.w500,
                color: AppColors.textFieldColor,
              ),

              suffixIcon: Icon(
                Icons.mic,
                color: AppColors.textFieldColor.withValues(alpha: 0.6),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.textFieldColor.withValues(alpha: 0.6),
              ),
              isDense: true,
              filled: true,
              fillColor: AppColors.textFieldFillColor.withValues(alpha: 0.012),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.textFieldFillColor.withValues(alpha: 0.012),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.textFieldFillColor.withValues(alpha: 0.012),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.textFieldFillColor.withValues(alpha: 0.012),
                ),
              ),
            ),
          ),

          ResponsiveHelper.verticalSpace(15),

          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.appRailBgColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.appRailSelectionColor,
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  Container(
                    height: 30,
                    width: 30,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.appUnarchiveContainerColor,
                    ),
                    child: Center(
                      child: AssetSvg(asset: AppImages.unarchiveIcon),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  widget.onSortTap.call();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 30,
                    width: 30,
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.appUnarchiveContainerColor,
                    ),
                    child: Center(child: AssetSvg(asset: AppImages.sortIcon)),
                  ),
                ),
              ),
            ],
          ),

          // List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: filtered.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 76),
                child: Divider(height: 1, color: Colors.grey.shade200),
              ),
              itemBuilder: (context, index) {
                final guest = filtered[index];
                final isSelected = guest.id == widget.selectedGuestId;

                return GuestListTile(
                  name: guest.name,
                  email: guest.email, 
                  phone: guest.phone,
                  isVip: guest.isVip,
                  isSelected: isSelected,
                  image: guest.image,
                  onTap: () => widget.onGuestSelected(guest.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
