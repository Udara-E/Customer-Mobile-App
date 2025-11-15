// lib/presentation/widgets/services/service_search_bar.dart
import 'package:flutter/material.dart';
import '../../../core/responsive/extensions.dart';
// import '../../../core/theme/colors.dart';

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
        height: 44.h,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F1F8),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: const Color.fromRGBO(140, 140, 140, 1),
              fontSize: 15.sp,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 8.w),
              child: Icon(Icons.search, color: Colors.grey[400], size: 22.w),
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    onPressed: onClear,
                    icon: Icon(
                      Icons.close,
                      size: 20.w,
                      color: Colors.grey[600],
                    ),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          ),
        ),
      ),
    );
  }
}
