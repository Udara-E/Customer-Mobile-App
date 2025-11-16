import 'package:customer_mobile_app/presentation/widgets/booking/professionals/filter_chips.dart';
import 'package:customer_mobile_app/presentation/widgets/booking/professionals/professional_card.dart';
import 'package:flutter/material.dart';

class ProfessionalsScreen extends StatefulWidget {
  const ProfessionalsScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalsScreen> createState() => _ProfessionalsScreenState();
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  int _currentFilterIndex = 0;
  String? _selectedProfName;

  final List<Map<String, dynamic>> _professionalsData = [
    {
      'name': 'Sophia Bennett',
      'role': 'Hair Stylist',
      'rating': 4.8,
      'availability': 'Available Today',
    },
    {
      'name': 'Ethan Carter',
      'role': 'Barber',
      'rating': 4.9,
      'availability': 'Available Today',
    },
    {
      'name': 'Olivia Harper',
      'role': 'Nail Technician',
      'rating': 4.7,
      'availability': 'Available Today',
    },
    {
      'name': 'Liam Foster',
      'role': 'Esthetician',
      'rating': 4.6,
      'availability': 'Available Today',
    },
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
          'Professionals',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: FilterChips(
              currentFilterIndex: _currentFilterIndex,
              onFilterSelected: (index) =>
                  setState(() => _currentFilterIndex = index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'All Professionals (${_professionalsData.length} found)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _professionalsData.length,
              itemBuilder: (context, index) {
                return ProfessionalCard(
                  professional: _professionalsData[index],
                  isSelected:
                      _selectedProfName == _professionalsData[index]['name'],
                  onSelect: (name) => setState(() => _selectedProfName = name),
                );
              },
            ),
          ),
          if (_selectedProfName != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$_selectedProfName Selected | ${_getSelectedProfRole()}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/datetime'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _getSelectedProfRole() {
    final prof = _professionalsData.firstWhere(
      (p) => p['name'] == _selectedProfName,
      orElse: () => {'role': ''},
    );
    return prof['role'] ?? '';
  }
}
