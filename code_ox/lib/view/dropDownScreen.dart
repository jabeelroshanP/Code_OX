import 'package:code_ox/controller/dropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DropdownProvider>(
      builder: (context, dropdownProvider, child) {
        return DropdownButton<String>(
          value: dropdownProvider.selectedValue,
          hint: Text('Select an option'),
          items: dropdownProvider.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            dropdownProvider.setSelectedValue(newValue);
          },
        );
      },
    );
  }
}