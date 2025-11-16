// =============================
// 📁 core/models/profile_model.dart
// =============================
class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final String address;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.address,
  });

  List<Map<String, String>> toDetailItems() => [
    {'label': 'Phone', 'value': phone},
    {'label': 'Gender', 'value': gender},
    {'label': 'Date of Birth', 'value': dob},
    {'label': 'Address', 'value': address},
  ];
}
