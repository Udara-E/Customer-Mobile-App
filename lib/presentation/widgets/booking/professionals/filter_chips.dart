import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  final int currentFilterIndex;
  final ValueChanged<int> onFilterSelected;

  const FilterChips({
    Key? key,
    required this.currentFilterIndex,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildChip('All', 0),
        const SizedBox(width: 8),
        _buildChip('Available Today', 1),
        const SizedBox(width: 8),
        _buildChip('Top Rated', 2),
      ],
    );
  }

  Widget _buildChip(String label, int index) {
    final bool isActive = index == currentFilterIndex;
    return GestureDetector(
      onTap: () => onFilterSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFBBDEFB) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFF1976D2) : Colors.black87,
          ),
        ),
      ),
    );
  }
}
