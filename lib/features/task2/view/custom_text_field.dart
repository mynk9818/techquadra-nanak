import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import 'text_field_label.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  final TextEditingController controller;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(label: label),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.crayola,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.white.withOpacity(.5)),
              filled: true,
              fillColor: AppColors.charlestonGreen,
              border: InputBorder.none,
            ),
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
