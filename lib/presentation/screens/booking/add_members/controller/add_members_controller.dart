import 'package:flutter/material.dart';

//Create Controller (State Management Logic)
class AddMembersController extends ChangeNotifier {
  String selectedCategory = 'Lady';
  int selectedBottomNav = 3;

  void updateCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void updateBottomNav(int index) {
    selectedBottomNav = index;
    notifyListeners();
  }
}
