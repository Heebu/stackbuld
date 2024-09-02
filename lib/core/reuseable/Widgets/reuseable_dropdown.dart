import 'package:flutter/material.dart';

import 'mainTextWidget.dart';

class ReusableDropdownButton extends StatelessWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const ReusableDropdownButton({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: title,
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text2(text: item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
