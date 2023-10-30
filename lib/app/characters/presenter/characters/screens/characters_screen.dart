import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../domain/entities/character.dart';
import '../../widgets/characters_section.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({
    Key? key,
    required this.onPressLogoutButton,
    required this.characters,
    required this.onPressCharacter,
  }) : super(key: key);

  final VoidCallback onPressLogoutButton;
  final VoidCallback onPressCharacter;
  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    final List<String> sections = [
      'Estudantes',
      'Funcionários',
      'Casa Grifinória',
      'Casa Sonserina',
      'Casa Corvinal',
      'Casa Lufa-Lufa',
    ];
    return Container(
      width: sizes.width,
      height: sizes.height,
      padding: const EdgeInsets.all(AppSizes.s16),
      child: Column(
        children: [
          VerticalSpace.s16,
          Expanded(
            child: ListView.separated(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return CharactersSection(
                  headerTitle: sections[index],
                  characters: characters,
                  onPressSeeAllButton: () => {},
                  onPressCharacter: () => {},
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
