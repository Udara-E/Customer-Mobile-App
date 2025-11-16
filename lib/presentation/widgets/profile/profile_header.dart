// =============================
// 📁 presentation/widgets/profile/profile_header.dart
// =============================
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.edit_outlined, size: 24, color: Colors.grey[700]),
            ],
          ),
          const SizedBox(height: 24),

          // Avatar
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 128,
                color: Colors.grey[600],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Name
          const Text(
            'Heshi Nimu',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            'hesh.nimu@email.com • +1 (555) 987-6543',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
