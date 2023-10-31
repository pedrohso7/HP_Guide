import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hp_guide/core/constants/theme/colors.dart';

import '../../../../core/constants/routes/routes.dart';
import '../../../../core/widgets/default_appbar.dart';
import '../../domain/entities/character.dart';
import 'screens/characters_section_screen.dart';

class CharactersSectionPresenter extends StatelessWidget {
  const CharactersSectionPresenter({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  void onPressBack() => Modular.to.pop();

  void onPressCard(String id) =>
      Modular.to.pushNamed('${AppRoutesPaths.characterDetails}/$id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppbar(
        onPressBackButton: onPressBack,
        title: 'Personagens',
      ),
      body: Column(
        children: [
          Expanded(
            child: CharactersSectionScreen(
              characters: characters,
              onTapCharacter: onPressCard,
            ),
          ),
        ],
      ),
    );
  }
}
