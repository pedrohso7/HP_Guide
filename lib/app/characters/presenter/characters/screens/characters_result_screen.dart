import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../domain/entities/character.dart';
import '../widgets/character_card.dart';

class CharactersSearchScreen extends StatelessWidget {
  const CharactersSearchScreen({
    Key? key,
    required this.characters,
    required this.onTapCharacter,
  }) : super(key: key);

  final List<Character> characters;
  final Function(String) onTapCharacter;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    int crossAxisCount = (sizes.width / AppSizes.s152).floor();
    return Container(
      width: sizes.width,
      height: sizes.height,
      padding: const EdgeInsets.all(AppSizes.s16),
      child: Column(
        children: [
          Expanded(
            child: Builder(builder: (context) {
              if (characters.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhum personagem com esse nome encontrado',
                    style: AppTextStyles.subtitle,
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppSizes.s8,
                  mainAxisSpacing: AppSizes.s8,
                  childAspectRatio: AppSizes.s136 / AppSizes.s184,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return CharacterCard(
                    name: character.name!,
                    house: character.house!,
                    image: character.image!,
                    onTap: () => onTapCharacter(character.id!),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
