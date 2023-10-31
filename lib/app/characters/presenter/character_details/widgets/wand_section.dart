import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../domain/entities/character.dart';

class WandSection extends StatelessWidget {
  const WandSection({
    super.key,
    required this.wand,
  });

  final Wand wand;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          wand.core!.isNotEmpty && wand.core!.isNotEmpty && wand.size != null,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.s16),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.s16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 18,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 5,
              offset: const Offset(0, 3),
              spreadRadius: -1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Varinha',
            ),
            Builder(builder: (context) {
              if (wand.props.isEmpty) {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Personagem não possui varinha',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    wand.core!,
                    style: AppTextStyles.defaultTextBold,
                  ),
                  Text(
                    wand.wood!,
                    style: AppTextStyles.defaultTextBold,
                  ),
                  Text(
                    wand.size.toString(),
                    style: AppTextStyles.defaultTextBold,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: AppSizes.s40,
              height: AppSizes.s40,
              child: Image.asset(
                AppImages.wand,
                fit: BoxFit.contain,
              ),
            ),
            HorizontalSpace.s16,
            Text(
              title,
              style: AppTextStyles.title,
            ),
          ],
        ),
        VerticalSpace.s8,
        const Divider(),
      ],
    );
  }
}
