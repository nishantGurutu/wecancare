import 'package:flutter/material.dart';
import '../common_textfield/common_textfield.dart';

class LabeledField extends StatelessWidget {
  final String title;
  final CommonTextField field;

  const LabeledField({
    super.key,
    required this.title,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        field,
      ],
    );
  }
}
