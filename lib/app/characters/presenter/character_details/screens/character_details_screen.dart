import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/widgets/default_back_page_widget.dart';
import '../../../domain/entities/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
    required this.onTapBack,
    required this.startAnimation,
  }) : super(key: key);

  final Character character;
  final VoidCallback onTapBack;
  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      width: sizes.width,
      height: sizes.height,
      // padding: const EdgeInsets.all(AppSizes.s16),
      child: Stack(
        children: [
          AnimatedHouseBanner(
            house: character.house!,
            startAnimation: startAnimation,
          ),
          Column(
            children: [
              DefaultBackPageWidget(
                title: 'Details',
                onTap: onTapBack,
              ),
              VerticalSpace.s160,
              CharacterAvatar(image: character.image!),
              VerticalSpace.s16,
              Text(character.name!),
            ],
          ),
        ],
      ),
    );
  }
}

class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.s128,
      height: AppSizes.s128,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.yellow,
          width: AppSizes.s2,
        ),
        borderRadius: BorderRadius.circular(AppSizes.s128),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.s128),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AnimatedHouseBanner extends StatelessWidget {
  const AnimatedHouseBanner({
    Key? key,
    required this.house,
    required this.startAnimation,
  }) : super(key: key);

  final CharacterHouse house;
  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 1000),
      width: sizes.width,
      height: startAnimation ? sizes.height / 2.4 : 0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppSizes.s24),
          bottomLeft: Radius.circular(AppSizes.s24),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(AppSizes.s24),
          bottomLeft: Radius.circular(AppSizes.s24),
        ),
        child: Image.asset(
          AppImages.gryffindorBannerImagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
