// lib/presentation/widgets/common/bottom_summary_bar.dart
import 'package:flutter/material.dart';
import '../../../core/responsive/extensions.dart';
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
      decoration: const BoxDecoration(
        color: AppColors.buttonLanguageAndWelcome,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: AppColors.serviceAddButton,
            thickness: 0.5,
            height: 0.5,
          ),
          SizedBox(height: 12.h),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16.w,
            runSpacing: 12.h,
            children: [
              Container(
                width: 172.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.serviceAddButton,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(
                        text: '$selectedCount Services Selected | ',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(
                        text: 'Total: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'LKR ${totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
                width: 82.w,
                child: ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonSecondary,
                    foregroundColor: AppColors.buttonLanguageAndWelcome,
                    padding: EdgeInsets.only(left: 16.w, right: 8.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
