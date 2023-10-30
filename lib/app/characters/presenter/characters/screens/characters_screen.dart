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

  List<Character> filterByCharacterHouse(CharacterHouse house) =>
      characters.where((e) => e.house == house).toList();

  List<Character> filterByCharacterCategory(CharacterCategory category) =>
      characters.where((e) => e.category == category).toList();

  List<Character> filterBySection(String section) {
    final stringMap = <String, List<Character>>{
      'Estudantes': filterByCharacterCategory(CharacterCategory.student),
      'Funcionários': filterByCharacterCategory(CharacterCategory.staff),
      'Casa Grifinória': filterByCharacterHouse(CharacterHouse.gryffindor),
      'Casa Sonserina': filterByCharacterHouse(CharacterHouse.slytherin),
      'Casa Corvinal': filterByCharacterHouse(CharacterHouse.ravenclaw),
      'Casa Lufa-Lufa': filterByCharacterHouse(CharacterHouse.hufflepuff),
    };

    return stringMap[section]!;
  }

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
                  characters: filterBySection(sections[index]),
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
