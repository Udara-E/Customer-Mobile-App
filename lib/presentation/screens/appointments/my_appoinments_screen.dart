
import 'package:customer_mobile_app/presentation/screens/appointments/appoinment_details_screen.dart';
import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatefulWidget {
  MyAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xffCCDBEB),
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Upcoming"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAppointmentList(),
          _buildAppointmentList(),
          _buildEmptyState("No completed appointments yet."),
          _buildEmptyState("No cancelled appointments."),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Appointment'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Promotion'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // ------------------ APPOINTMENT LIST -------------------
  Widget _buildAppointmentList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAppointmentCard(
          title: "Haircut & Style",
          subTitle: "Salon Elegance · Sophia Carter",
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          title: "Manicure",
          subTitle: "Nail Studio · Olivia Bennett",
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          title: "Facial",
          subTitle: "Skin Clinic · Isabella Harper",
        ),
      ],
    );
  }

  // ------------------ APPOINTMENT CARD -------------------
  Widget _buildAppointmentCard({
    required String title,
    required String subTitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT SIDE TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirmed",
                  style: TextStyle(
                    color: Color(0xff5E738C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 23),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 23),
                ),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  style: const TextStyle(color:Color(0xff5E738C))),
                
                const SizedBox(height: 23),

                // ------------------ RESCHEDULE BUTTON ------------------
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                         const AppointmentDetailsScreen(), // Navigate page
                      ),
                    );
                  },
                  child: Container(
                    width: 125,
                    height: 32,
                    padding:
                        const EdgeInsets.only(left: 16, right: 8),
                    decoration: BoxDecoration(
                      color: Color(0xff0056A4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Reschedule",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // IMAGE PLACEHOLDER
          Container(
            width: 88,
            height: 118,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, width: 1.4),
            ),
            child: const Icon(Icons.image, size: 28, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ------------------ EMPTY STATE -------------------
  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(message, style: TextStyle(color: Colors.grey.shade600)),
    );
  }
}
