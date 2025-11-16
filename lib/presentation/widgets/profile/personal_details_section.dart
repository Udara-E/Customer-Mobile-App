import 'package:customer_mobile_app/presentation/widgets/profile/profile_detail_item.dart';
import 'package:flutter/material.dart';

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 26),
            child: const Text(
              'Personal Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DetailItem(label: 'Full Name', value: 'Heshi Nimu'),
                SizedBox(height: 16),
                DetailItem(label: 'Email', value: 'hesh.nimu@email.com'),
                SizedBox(height: 16),
                DetailItem(label: 'Mobile', value: '+84 77 987-6543'),
                SizedBox(height: 16),
                DetailItem(label: 'Gender', value: 'Female'),
                SizedBox(height: 16),
                DetailItem(label: 'Date of Birth', value: '08/22/2000'),
                SizedBox(height: 16),
                DetailItem(
                  label: 'Address',
                  value: '36,flower street, Colombo 07',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
