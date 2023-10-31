import 'package:flutter/material.dart';

import '../constants/theme/colors.dart';
import '../constants/theme/sizes.dart';
import '../constants/theme/text_style.dart';
import '../extensions/sized_box_extension.dart';

class DefaultBackPageWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DefaultBackPageWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.s16,
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black54,
              size: AppSizes.s40,
            ),
          ),
          HorizontalSpace.s16,
          Text(
            title,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: AppFontSizes.s20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
