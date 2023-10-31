import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/widgets/section_card.dart';
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
      child: SectionCard(
        isImageVisible: true,
        title: 'Varinha',
        image: AppImages.wand,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
