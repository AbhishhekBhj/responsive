// Guest list tile
import 'package:eigital_task/core/design/typography.dart';
import 'package:flutter/material.dart';

import '../../../core/design/colors.dart';
import '../../../core/helpers/common_helpers.dart';
import '../../../core/responsive/adaptive.dart';
import '../../../core/responsive/responsive_helper.dart';

class GuestListTile extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final bool isVip;
  final bool isSelected;
  final VoidCallback onTap;
  final String? image;

  const GuestListTile({
    super.key,
    required this.name,
    required this.email,
    required this.isVip,
    required this.phone,
    required this.isSelected,
    required this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14);

    return Material(

      color: isSelected ?  AppColors.textFieldColor.withValues(alpha: .12) :  Colors.white,
      borderRadius: borderRadius,
      child: GestureDetector(
      
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: 
                image!=null?
                Image.asset(
                  image!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ):
                
                Text(
                  CommonHelpers.initialsFromName(name),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ResponsiveHelper.horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.montserrat(
                              fontSize: Adaptive.fontSize(context, 22),
                              color: AppColors.appRailBgColor,
                              fontWeight: FontWeight.w500  

                            ),
                          ),
                        ),
                        
                      ],
                    ),
                
                    Text(
                      email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:  AppTypography.montserrat(
                              fontSize: Adaptive.fontSize(context, 14),
                              color: AppColors.appRailBgColor,
                              
                              fontWeight: FontWeight.w500  

                            ),
                    ),
                    ResponsiveHelper.verticalSpace(4),
                    Text(
                      phone,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:  AppTypography.montserrat(
                              fontSize: Adaptive.fontSize(context, 14),
                              color: AppColors.appRailBgColor,
                              
                              fontWeight: FontWeight.w500  

                            ),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  
}
