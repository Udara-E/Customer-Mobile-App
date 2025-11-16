

import 'package:flutter/material.dart';
import 'booking_success_screen.dart';

class BookingFlowScreen extends StatefulWidget {
  const BookingFlowScreen({Key? key}) : super(key: key);

  @override
  State<BookingFlowScreen> createState() => _BookingFlowScreenState();
}

class _BookingFlowScreenState extends State<BookingFlowScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Appointment Summary',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppointmentCard(
                  'You', 'Haircut, Manicure · Emily, Olivia', 'Fri, Jul 12, 2:00 PM'),
              const SizedBox(height: 25),
              _buildAppointmentCard(
                  'Anna', 'Haircut, Manicure · Emily, Olivia', 'Fri, Jul 12, 2:00 PM'),
              const SizedBox(height: 12),
              _buildAppointmentCard(
                  'Ravi', 'Haircut, Manicure · Emily, Olivia', 'Fri, Jul 12, 2:00 PM'),
              const SizedBox(height: 24),
              const Text(
                'Pricing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _pricingCard(),
              const SizedBox(height: 32),
              _confirmButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  // 📌 Appointment Card
  Widget _buildAppointmentCard(String name, String services, String dateTime) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
          const SizedBox(height: 6),
          Text(services,
              style: const TextStyle(fontSize: 14, color: Color(0xFF6B7BA7))),
          const SizedBox(height: 4),
          Text(dateTime,
              style: const TextStyle(fontSize: 14, color: Color(0xFF6B7BA7))),
        ],
      ),
    );
  }

  // 📌 Pricing Card
  Widget _pricingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtotal + Group Discount
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Subtotal
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Subtotal',
                      style: TextStyle(color: Color(0xFF6B7BA7), fontSize: 14)),
                  Text('per person',
                      style: TextStyle(color: Color(0xFF6B7BA7), fontSize: 14)),
                  SizedBox(height: 4),
                  Text('\$120',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(width: 20), // space between subtotal & discount
              // Group Discount
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Group Discount',
                      style: TextStyle(color: Color(0xFF6B7BA7), fontSize: 14)),
                  SizedBox(height: 8),
                  Text('-\$10',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE5E7EB)),
          const SizedBox(height: 16),
          // Total Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Total',
                  style: TextStyle(color: Color(0xFF6B7BA7), fontSize: 14)),
              Text('Amount',
                  style: TextStyle(color: Color(0xFF6B7BA7), fontSize: 14)),
              SizedBox(height: 4),
              Text('\$220',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }

  // 📌 Confirm Button → Navigate to success page
  Widget _confirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingSuccessScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A7BA7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Confirm Appointment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // 📌 Bottom Navigation Bar
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF4A7BA7),
      unselectedItemColor: const Color(0xFF9CA3AF),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Appointments'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined), label: 'Promotions'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
