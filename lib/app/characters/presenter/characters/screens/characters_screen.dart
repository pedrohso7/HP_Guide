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

  static const List<String> _sections = [
    'Estudantes',
    'Funcionários',
    'Casa Grifinória',
    'Casa Sonserina',
    'Casa Corvinal',
    'Casa Lufa-Lufa',
  ];

  List<Character> _filterByCharacterHouse(CharacterHouse house) =>
      characters.where((e) => e.house == house).toList();

  List<Character> _filterByCharacterCategory(CharacterCategory category) =>
      characters.where((e) => e.category == category).toList();

  List<Character> _filterBySection(String section) {
    final stringMap = <String, List<Character>>{
      'Estudantes': _filterByCharacterCategory(CharacterCategory.student),
      'Funcionários': _filterByCharacterCategory(CharacterCategory.staff),
      'Casa Grifinória': _filterByCharacterHouse(CharacterHouse.gryffindor),
      'Casa Sonserina': _filterByCharacterHouse(CharacterHouse.slytherin),
      'Casa Corvinal': _filterByCharacterHouse(CharacterHouse.ravenclaw),
      'Casa Lufa-Lufa': _filterByCharacterHouse(CharacterHouse.hufflepuff),
    };

    return stringMap[section]!;
  }

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
              itemCount: _sections.length,
              itemBuilder: (context, index) {
                return CharactersSection(
                  headerTitle: _sections[index],
                  characters: _filterBySection(_sections[index]),
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
