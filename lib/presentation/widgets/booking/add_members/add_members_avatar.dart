import 'package:customer_mobile_app/core/responsive/extensions.dart';
import 'package:flutter/material.dart';

class AddMembersAvatar extends StatelessWidget {
  const AddMembersAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: const BoxDecoration(
            color: Color(0xFF9E9E9E),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF9E9E9E),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shenya gamage',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 6.w),
            const Icon(Icons.edit_outlined, size: 18, color: Colors.black),
          ],
        ),
      ],
    );
  }
}
