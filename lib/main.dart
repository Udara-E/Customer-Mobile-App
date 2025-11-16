// import 'package:customer_mobile_app/presentation/screens/booking/add_members/add_members_screen.dart';
import 'package:customer_mobile_app/presentation/screens/booking/date_time/date_time_screen.dart';
// import 'package:customer_mobile_app/presentation/screens/booking/professionals/professionals_screen.dart';
// import 'package:customer_mobile_app/presentation/screens/profile/profile_screen.dart';
// import 'package:customer_mobile_app/presentation/screens/services/services_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DateTimeScreen(),
    );
  }
}
