import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        label,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
