import 'package:customer_mobile_app/presentation/screens/profile/profile_screen.dart';
import 'package:customer_mobile_app/presentation/widgets/appointment/appointment_datetime_card.dart';
import 'package:customer_mobile_app/presentation/widgets/appointment/service_item_widget.dart';
import 'package:customer_mobile_app/presentation/widgets/appointment/total_price_card.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/professionals/professional_card.dart';
import 'package:flutter/material.dart';

class AppointmentSummaryScreen extends StatelessWidget {
  AppointmentSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> selectedServices = [
      {'icon': Icons.content_cut, 'name': 'Haircut', 'price': 'LKR 2,000'},
      {'icon': Icons.brush, 'name': 'Hair Coloring', 'price': 'LKR 2,000'},
      {'icon': Icons.spa, 'name': 'Facial Treatment', 'price': 'LKR 3,000'},
      {
        'icon': Icons.face_retouching_natural,
        'name': 'Makeup',
        'price': 'LKR 4,000',
      },
      {'icon': Icons.content_cut, 'name': 'Haircut', 'price': 'LKR 2,000'},
      {'icon': Icons.brush, 'name': 'Hair Coloring', 'price': 'LKR 2,000'},
      {'icon': Icons.spa, 'name': 'Facial Treatment', 'price': 'LKR 3,000'},
      {
        'icon': Icons.face_retouching_natural,
        'name': 'Makeup',
        'price': 'LKR 4,000',
      },
    ];

    final totalPrice = selectedServices.fold<int>(
      0,
      (sum, service) =>
          sum + int.parse(service['price'].replaceAll(RegExp(r'[^0-9]'), '')),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Appointment Summary',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Services Selected',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    itemCount: selectedServices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final service = selectedServices[index];
                      return ServiceItemWidget(
                        icon: service['icon'],
                        serviceName: service['name'],
                        price: service['price'],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Professional',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ProfessionalCard(
                    professional: const {
                      'name': 'John Doe',
                      'role': 'Hair Stylist',
                      'rating': 4.5,
                      'availability': 'Available',
                    },
                    isSelected: true,
                    onSelect: (String) {},
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Appointment Date & Time',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppointmentDateTimeCard(),
                  const SizedBox(height: 16),
                  TotalPriceCard(
                    totalPrice: totalPrice,
                  ), // runtime value, cannot be const
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
