// =============================
// 📁 presentation/screens/profile/profile_screen.dart
// =============================
import 'package:customer_mobile_app/presentation/widgets/profile/app_bottom_nav.dart';
import 'package:customer_mobile_app/presentation/widgets/profile/payment_method_item.dart';
import 'package:flutter/material.dart';
import '../../widgets/profile/profile_header.dart';
import '../../widgets/profile/personal_details_section.dart';
import '../../widgets/profile/logout_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ProfileHeader(),
              PersonalDetailsSection(),
              PaymentMethodsSection(),
              LogoutSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
