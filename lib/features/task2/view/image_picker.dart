import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    super.key,
    required this.mediaQuery,
  });

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.chineseBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.maxFinite,
      height: mediaQuery.size.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: mediaQuery.size.width * .05,
            color: AppColors.crayola,
          ),
          SizedBox(height: mediaQuery.size.height * .02),
          Text(
            "Add Photo",
            style: TextStyle(fontSize: 32, color: AppColors.white),
          )
        ],
      ),
    );
  }
}
