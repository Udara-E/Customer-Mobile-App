import 'package:customer_mobile_app/presentation/widgets/booking/date_time/date_picker_card.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/date_time/time_slot_card.dart';
import 'package:flutter/material.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({Key? key}) : super(key: key);

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  String selectedDate = '01/10/2025';
  TimeSlot? selectedTimeSlot;

  final List<TimeSlot> timeSlots = [
    TimeSlot(time: '09:00 - 10:00', isAvailable: true),
    TimeSlot(time: '12:00 - 13:00', isAvailable: true),
    TimeSlot(time: '10:00 - 11:00', isAvailable: true),
    TimeSlot(time: '13:00 - 14:00', isAvailable: true),
    TimeSlot(time: '11:00 - 12:00', isAvailable: true),
    TimeSlot(time: '15:00 - 16:00', isAvailable: true),
    TimeSlot(time: '16:00 - 17:00', isAvailable: true),
    TimeSlot(time: '17:00 - 18:00', isAvailable: true),
    TimeSlot(time: '18:00 - 19:00', isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Date & Time',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ListView(
          children: [
            const Text(
              'Select a Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            DatePickerCard(
              selectedDate: selectedDate,
              onDateSelected: (date) => setState(() => selectedDate = date),
            ),
            const SizedBox(height: 24),
            const Text(
              'Available Time slots',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                final time = timeSlots[index];
                return TimeSlotCard(
                  timeSlot: time,
                  isSelected: selectedTimeSlot == time,
                  onSelect: () => setState(() => selectedTimeSlot = time),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => {},
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const AppointmentSummaryScreen(),
            //   ),
            // ),
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
              'Confirm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentSummaryScreen {
  const AppointmentSummaryScreen();
}

class TimeSlot {
  final String time;
  final bool isAvailable;
  TimeSlot({required this.time, required this.isAvailable});
}
