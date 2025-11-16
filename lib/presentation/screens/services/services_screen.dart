import 'package:flutter/material.dart';
import '../../../core/responsive/size_config.dart';
import '../../../core/responsive/extensions.dart';
import '../../../core/responsive/typography.dart';
import '../../../core/theme/colors.dart';
import '../../widgets/booking/services/service_card.dart';
import '../../widgets/booking/services/service_search_bar.dart';
import '../../widgets/booking/services/bottom_summary_bar.dart';
import 'package:customer_mobile_app/data/models/service_model.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late List<ServiceItem> services;
  late List<ServiceItem> filtered;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    services = _initialServices();
    filtered = List.from(services);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  List<ServiceItem> _initialServices() => [
    ServiceItem(
      name: 'Haircut',
      description: 'A classic haircut to refresh your style.',
      isSelected: true,
      price: 2250,
    ),
    ServiceItem(
      name: 'Manicure',
      description: 'Treat your hands to a relaxing manicure.',
      isSelected: false,
      price: 1500,
    ),
    ServiceItem(
      name: 'Makeup',
      description: 'Get a professional makeup application.',
      isSelected: true,
      price: 2250,
    ),
    ServiceItem(
      name: 'Facial',
      description: 'Rejuvenate your skin with a soothing facial.',
      isSelected: false,
      price: 3000,
    ),
    ServiceItem(
      name: 'Beard Trim',
      description: 'Clean and style your beard.',
      isSelected: true,
      price: 1800,
    ),
    ServiceItem(
      name: 'Hair Coloring',
      description: 'Modern hair coloring with natural look.',
      isSelected: false,
      price: 3500,
    ),
    ServiceItem(
      name: 'Hair Spa',
      description: 'Deep conditioning treatment for healthy, shiny hair.',
      isSelected: false,
      price: 4000,
    ),
    ServiceItem(
      name: 'Pedicure',
      description: 'Relaxing foot care and nail treatment.',
      isSelected: false,
      price: 2800,
    ),
    ServiceItem(
      name: 'Manicure (Pro)',
      description: 'Professional hand and nail grooming.',
      isSelected: false,
      price: 2500,
    ),
    ServiceItem(
      name: 'Head Massage',
      description: 'Relieves stress and improves blood circulation.',
      isSelected: false,
      price: 2200,
    ),
    ServiceItem(
      name: 'Body Massage',
      description: 'Full-body massage for ultimate relaxation.',
      isSelected: false,
      price: 5500,
    ),
    ServiceItem(
      name: 'Waxing',
      description: 'Smooth, hair-free skin with gentle waxing.',
      isSelected: false,
      price: 3200,
    ),
    ServiceItem(
      name: 'Eyebrow Shaping',
      description: 'Perfectly defined eyebrows with expert care.',
      isSelected: false,
      price: 1500,
    ),
    ServiceItem(
      name: 'Bridal Makeup',
      description: 'Flawless and elegant makeup for your big day.',
      isSelected: false,
      price: 8500,
    ),
    ServiceItem(
      name: 'Hair Straightening',
      description: 'Professional straightening for a sleek look.',
      isSelected: false,
      price: 6500,
    ),
    ServiceItem(
      name: 'Hair Perming',
      description: 'Add curls and volume with a stylish perm.',
      isSelected: false,
      price: 6000,
    ),
    ServiceItem(
      name: 'Scalp Treatment',
      description: 'Cleanses and nourishes the scalp to prevent hair loss.',
      isSelected: false,
      price: 3500,
    ),
  ];

  void _onSearchChanged() {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) {
      setState(() => filtered = List.from(services));
      return;
    }
    setState(() {
      filtered = services.where((s) {
        return s.name.toLowerCase().contains(q) ||
            s.description.toLowerCase().contains(q);
      }).toList();
    });
  }

  int get selectedCount => services.where((s) => s.isSelected).length;
  double get totalPrice =>
      services.where((s) => s.isSelected).fold(0, (sum, s) => sum + s.price);

  void _toggleService(ServiceItem s) {
    setState(() {
      s.toggleSelected();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 22.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Services',
          style: AppTypography.h1.copyWith(
            fontSize: 22.sp,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ServiceSearchBar(
            controller: _searchController,
            onClear: () {
              _searchController.clear();
              _onSearchChanged();
            },
            onChanged: (_) {},
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final svc = filtered[index];
                return ServiceCard(
                  service: svc,
                  assetPath: 'assets/icons/image_icon.png',
                  onToggle: () => _toggleService(svc),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomSummaryBar(
        selectedCount: selectedCount,
        totalPrice: totalPrice,
        onNext: () {
          Navigator.pushNamed(context, '/professional');
        },
      ),
    );
  }
}
