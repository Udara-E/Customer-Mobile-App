// lib/presentation/widgets/services/service_search_bar.dart
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
          color: const Color(0xFFE8F1F8),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 22.w, color: Colors.grey[400]),

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
                    color: const Color.fromRGBO(140, 140, 140, 1),
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
                child: Icon(Icons.close, size: 20.w, color: Colors.grey[600]),
              ),
          ],
        ),
      ),
    );
  }
}
