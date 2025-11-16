import 'package:customer_mobile_app/core/responsive/extensions.dart';
import 'package:customer_mobile_app/presentation/screens/booking/add_members/controller/add_members_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMembersBottomNavBar extends StatelessWidget {
  const AddMembersBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddMembersController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 65.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(context, Icons.home, "Home", 0, controller),
              _item(
                context,
                Icons.calendar_today_outlined,
                "Appointment",
                1,
                controller,
              ),
              _item(
                context,
                Icons.local_offer_outlined,
                "Promotion",
                2,
                controller,
              ),
              _item(context, Icons.person_outline, "Profile", 3, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    AddMembersController controller,
  ) {
    bool active = controller.selectedBottomNav == index;

    return InkWell(
      onTap: () => controller.updateBottomNav(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? const Color(0xFF5B8DEE) : const Color(0xFF9E9E9E),
            size: 24.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: active ? const Color(0xFF5B8DEE) : const Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}
