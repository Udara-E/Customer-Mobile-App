// lib/presentation/widgets/services/service_card.dart
import 'package:flutter/material.dart';
import '../../../core/responsive/extensions.dart';
// import '../../../core/responsive/app_sizes.dart';
import '../../../core/responsive/typography.dart';
import '../../../core/theme/colors.dart';
import '../../../data//models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback onToggle;
  final String? assetPath; // optional image path

  const ServiceCard({
    Key? key,
    required this.service,
    required this.onToggle,
    this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        children: [
          // Left column: text + button
          SizedBox(
            width: 172.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: AppTypography.h2.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  service.description,
                  style: AppTypography.body.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: onToggle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: service.isSelected
                          ? AppColors.primary
                          : const Color(0xFFE8F1F8),
                      foregroundColor: service.isSelected
                          ? AppColors.white
                          : AppColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 6.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      service.isSelected ? 'Added' : 'Add',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: service.isSelected
                            ? AppColors.white
                            : AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 20.w),

          // Right: image/icon
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: assetPath != null
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        assetPath!,
                        width: 98.w,
                        height: 119.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 98.w,
                      height: 119.h,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Icon(
                        Icons.photo,
                        size: 40.w,
                        color: AppColors.textSecondary,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
