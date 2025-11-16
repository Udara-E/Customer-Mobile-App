// lib/presentation/widgets/services/service_search_bar.dart
import 'package:customer_mobile_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/responsive/extensions.dart';

class ServiceSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;

  const ServiceSearchBar({
    Key? key,
    required this.controller,
    this.onClear,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Container(
        height: 44.h, // You used 44 before; keep consistent
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 22.w, color: AppColors.serviceSearchIcon),

            SizedBox(width: 10.w),

            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.serviceSearchIcon,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                  border: InputBorder.none,
                  isCollapsed: true, // FIXES vertical alignment
                ),
              ),
            ),

            if (controller.text.isNotEmpty)
              GestureDetector(
                onTap: onClear,
                child: Icon(
                  Icons.close,
                  size: 20.w,
                  color: AppColors.serviceSearchIcon,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
