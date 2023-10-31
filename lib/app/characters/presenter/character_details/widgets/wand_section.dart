import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
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
            InfoRow(mapKey: 'Núcleo', value: wand.core!),
            InfoRow(mapKey: 'Madeira', value: wand.wood!),
            InfoRow(
              mapKey: 'Tamanho',
              value: wand.size != null ? wand.size.toString() : '',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String mapKey;
  final String value;
  const InfoRow({
    super.key,
    required this.mapKey,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.isNotEmpty,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mapKey,
                style: AppTextStyles.defaultTextBold,
              ),
              Text(
                value,
                style: AppTextStyles.defaultText,
              ),
            ],
          ),
          VerticalSpace.s8,
        ],
      ),
    );
  }
}
