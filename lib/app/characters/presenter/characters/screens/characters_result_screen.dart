import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../domain/entities/character.dart';
import '../../widgets/character_card.dart';

class CharactersSearchScreen extends StatelessWidget {
  const CharactersSearchScreen({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      width: sizes.width,
      height: sizes.height,
      padding: const EdgeInsets.all(AppSizes.s16),
      child: Column(
        children: [
          VerticalSpace.s16,
          Expanded(
            child: ListView.separated(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  name: characters[index].name!,
                  image: characters[index].image!,
                  house: characters[index].house,
                  onTap: () => {},
                );
              },
              separatorBuilder: (context, index) => VerticalSpace.s24,
            ),
          ),
        ],
      ),
    );
  }
}
