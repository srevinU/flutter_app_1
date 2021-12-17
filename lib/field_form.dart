import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final String labelField;
  const FieldForm({
    Key? key,
    required this.labelField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("labelField: $labelField");
    return TextFormField(
      decoration: const InputDecoration(labelText: "labelField"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
