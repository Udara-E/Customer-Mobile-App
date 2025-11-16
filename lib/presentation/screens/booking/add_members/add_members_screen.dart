import 'package:customer_mobile_app/core/responsive/extensions.dart';
import 'package:customer_mobile_app/core/responsive/size_config.dart';
import 'package:customer_mobile_app/presentation/screens/services/services_screen.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/add_members/add_members_avatar.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/add_members/add_members_form.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/add_members/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/add_members_controller.dart';

class AddMembersScreen extends StatelessWidget {
  const AddMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ChangeNotifierProvider(
      create: (_) => AddMembersController(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          title: const Text(
            'Add Members',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32.h),
              const AddMembersAvatar(),
              SizedBox(height: 32.h),
              const AddMembersForm(),
              SizedBox(height: 20.h),

              /// ADD BUTTON
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B8DEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// DELETE BUTTON
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                height: 48.h,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),

        bottomNavigationBar: const AddMembersBottomNavBar(),
      ),
    );
  }
}
