import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../helpers/shared_pref_helper.dart';

typedef OnChange = void Function(int index);

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton(
      {super.key, required this.currentSelected, required this.onChange});
  final int currentSelected;
  final OnChange onChange;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late int currentSelected = widget.currentSelected;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPrefHelper.getPet().then((value) {
        setState(() {
          currentSelected = value.gender?.toLowerCase() == "female" ? 1 : 0;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.onChange(0);
              setState(() {
                currentSelected = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (currentSelected == 0) ? AppColors.crayola : AppColors.white,
              foregroundColor:
                  (currentSelected == 0) ? AppColors.white : AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
            child: const Text("Male"),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.onChange(1);
              setState(() {
                currentSelected = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (currentSelected == 1) ? AppColors.crayola : AppColors.white,
              foregroundColor:
                  (currentSelected == 1) ? AppColors.white : AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
            child: const Text("Fe-Male"),
          ),
        )
      ],
    );
  }
}
