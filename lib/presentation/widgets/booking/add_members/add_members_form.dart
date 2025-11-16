import 'package:customer_mobile_app/core/responsive/extensions.dart';
import 'package:customer_mobile_app/presentation/screens/booking/add_members/controller/add_members_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_button.dart';

class AddMembersForm extends StatelessWidget {
  const AddMembersForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddMembersController>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4.h),
          Text(
            'Shemaya Gamage',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF5B8DEE)),
          ),
          SizedBox(height: 20.h),

          Text(
            'Gender',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4.h),
          Text(
            'Female',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF5B8DEE)),
          ),
          SizedBox(height: 20.h),

          Text(
            'Choose Age Category',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),

          /// ROW 1
          Row(
            children: [
              Expanded(
                child: CategoryButton(
                  label: "Gentlemen",
                  selected: controller.selectedCategory == "Gentlemen",
                  onTap: () => controller.updateCategory("Gentlemen"),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CategoryButton(
                  label: "Lady",
                  selected: controller.selectedCategory == "Lady",
                  onTap: () => controller.updateCategory("Lady"),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          /// ROW 2
          Row(
            children: [
              Expanded(
                child: CategoryButton(
                  label: "Teenager/boy",
                  selected: controller.selectedCategory == "Teenager/boy",
                  onTap: () => controller.updateCategory("Teenager/boy"),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CategoryButton(
                  label: "Teenager/girl",
                  selected: controller.selectedCategory == "Teenager/girl",
                  onTap: () => controller.updateCategory("Teenager/girl"),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          /// ROW 3
          Row(
            children: [
              Expanded(
                child: CategoryButton(
                  label: "Kid/boy",
                  selected: controller.selectedCategory == "Kid/boy",
                  onTap: () => controller.updateCategory("Kid/boy"),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CategoryButton(
                  label: "Kid/girl",
                  selected: controller.selectedCategory == "Kid/girl",
                  onTap: () => controller.updateCategory("Kid/girl"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
