import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../domain/entities/character.dart';
import '../widgets/character_card.dart';

class CharactersSearchScreen extends StatelessWidget {
  const CharactersSearchScreen({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

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
                  child: Text('Nenhum personagem com esse nome encontrado'),
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
                  return CharacterCard(
                    name: characters[index].name!,
                    house: characters[index].house!,
                    image: characters[index].image!,
                    onTap: () => {},
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
