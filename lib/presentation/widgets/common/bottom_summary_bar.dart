// lib/presentation/widgets/common/bottom_summary_bar.dart
import 'package:flutter/material.dart';
import '../../../core/responsive/extensions.dart';
import '../../../core/responsive/app_sizes.dart';
import '../../../core/theme/colors.dart';

class BottomSummaryBar extends StatelessWidget {
  final int selectedCount;
  final double totalPrice;
  final VoidCallback onNext;

  const BottomSummaryBar({
    Key? key,
    required this.selectedCount,
    required this.totalPrice,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 22.h,
        top: 12.h,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Colors.grey[300], thickness: 0.5, height: 0.5),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 172.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(
                        text: '$selectedCount Services Selected | ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(
                        text: 'Total: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'LKR ${totalPrice.toStringAsFixed(0)}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                height: AppSizes.buttonHeight,
                child: ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.arrow_forward, size: 18.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
