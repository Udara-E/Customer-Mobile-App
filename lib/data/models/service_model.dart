// lib/data/models/service_item.dart
class ServiceItem {
  final String name;
  final String description;
  bool isSelected;
  final double price;

  ServiceItem({
    required this.name,
    required this.description,
    this.isSelected = false,
    required this.price,
  });

  // Useful helper for toggling
  void toggleSelected() => isSelected = !isSelected;
}
