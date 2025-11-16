import 'package:flutter/material.dart';

// Import your screens
import 'presentation/screens/appointments/my_appoinments_screen.dart';
import 'presentation/screens/appointments/appoinment_details_screen.dart';

import 'presentation/screens/booking/booking_flow_screen.dart';
import 'presentation/screens/booking/add_members_screen.dart';
import 'presentation/screens/booking/booking_success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salon Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      // Initial Screen
      home: const BookingFlowScreen(),

      // Named Routes
      routes: {
        '/bookingFlow': (context) => const BookingFlowScreen(),
        '/addMembers': (context) => const AddMembersScreen(),
        '/bookingSuccess': (context) => const BookingSuccessScreen(),
        '/appointments': (context) => MyAppointmentScreen(),
      },
    );
  }
}
