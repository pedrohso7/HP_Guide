import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../domain/entities/character.dart';
import 'character_card.dart';

class CharactersSection extends StatelessWidget {
  const CharactersSection({
    super.key,
    required this.headerTitle,
    required this.characters,
    required this.onPressSeeAllButton,
    required this.onTapCharacter,
  });

  final String headerTitle;
  final List<Character> characters;
  final VoidCallback onPressSeeAllButton;
  final Function(String) onTapCharacter;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
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
          SectionHeader(
            title: headerTitle,
            actions: [
              TextButton(
                onPressed: onPressSeeAllButton,
                child: const Text(
                  'Ver todos',
                  style: AppTextStyles.defaultYellowText,
                ),
              )
            ],
          ),
          SizedBox(
            width: sizes.width,
            height: AppSizes.s200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                if (index > 10) return const SizedBox.shrink();
                final character = characters[index];
                return CharacterCard(
                  name: character.name!,
                  image: character.image!,
                  house: character.house!,
                  onTap: () => onTapCharacter(character.id!),
                );
              },
              separatorBuilder: (context, index) => HorizontalSpace.s8,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.actions,
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitleWidget(title: title),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: AppSizes.s8,
                runSpacing: AppSizes.s16,
                children: List.generate(
                  actions.length,
                  (index) => actions[index],
                ),
              ),
            ),
          ],
        ),
        VerticalSpace.s8,
        const Divider(),
      ],
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.subtitle,
        ),
        HorizontalSpace.s16,
      ],
    );
  }
}
