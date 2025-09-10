import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier {
  String? selectedValue;
  List<String> items = ['Electronics', 'Clothing','Jewellery'];

  void setSelectedValue(String? newValue) {
    selectedValue = newValue;
    notifyListeners();
  }
}
