import 'package:flutter/material.dart';

import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/widgets/filled_container.dart';
import '../../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
  final CharacterHouse? house;

  const CharacterCard({
    Key? key,
    required this.name,
    required this.image,
    required this.onTap,
    this.house = CharacterHouse.other,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.s152,
        height: AppSizes.s264,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: AppSizes.s2,
          ),
          borderRadius: BorderRadius.circular(AppSizes.s24),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CharacterImageComponent(image: image),
            CharacterTitleComponent(name: name),
          ],
        ),
      ),
    );
  }
}

class CharacterTitleComponent extends StatelessWidget {
  final String name;

  const CharacterTitleComponent({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.4,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppSizes.s24),
            bottomLeft: Radius.circular(AppSizes.s24),
          ),
          gradient: LinearGradient(
            colors: [AppColors.black, AppColors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(
          bottom: AppSizes.s8,
          left: AppSizes.s8,
          right: AppSizes.s8,
        ),
        child: Text(
          name,
          style: AppTextStyles.defaultYellowText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CharacterImageComponent extends StatelessWidget {
  final String image;

  const CharacterImageComponent({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.s24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.s24),
          child: Builder(builder: (context) {
            if (image.isEmpty) {
              return Image.asset(
                AppImages.noPhoto,
                fit: BoxFit.cover,
              );
            }
            return Image.network(
              image,
              fit: BoxFit.cover,
            );
          }),
        ),
      ),
    );
  }
}
