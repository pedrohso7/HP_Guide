import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/widgets/default_back_page_widget.dart';
import '../../../domain/entities/character.dart';
import '../widgets/wand_section.dart';
import '../widgets/extra_info_section.dart';

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
    return SizedBox(
      width: sizes.width,
      height: sizes.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedHouseBanner(
              house: character.house ?? CharacterHouse.other,
              startAnimation: startAnimation,
            ),
            Column(
              children: [
                DefaultBackPageWidget(
                  title: 'Details',
                  onTap: onTapBack,
                ),
                VerticalSpace.s144,
                CharacterAvatar(image: character.image!),
                VerticalSpace.s16,
                Text(character.name!),
                VerticalSpace.s16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                  child: WandSection(wand: character.wand!),
                ),
                VerticalSpace.s16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                  child: ExtraInfoSection(character: character),
                ),
                VerticalSpace.s16,
              ],
            ),
          ],
        ),
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

  getImageByHouse() {
    final map = <CharacterHouse, String>{
      CharacterHouse.gryffindor: AppImages.gryffindorBannerImagePath,
      CharacterHouse.slytherin: AppImages.slytherinBannerImagePath,
      CharacterHouse.ravenclaw: AppImages.ravenclawBannerImagePath,
      CharacterHouse.hufflepuff: AppImages.hufflepufsBannerImagePath,
    };

    return map[house] ?? AppImages.noPhoto;
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 1000),
      width: sizes.width,
      height: startAnimation ? sizes.height / 2.55 : 0,
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
          getImageByHouse(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
