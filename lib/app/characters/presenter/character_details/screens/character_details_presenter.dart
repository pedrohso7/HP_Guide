import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../domain/entities/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
    // required this.onPressLogoutButton,
    // required this.onPressCharacter,
  }) : super(key: key);

  // final VoidCallback onPressLogoutButton;
  // final VoidCallback onPressCharacter;
  final Character character;

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
          Text('kxzjnknndmksj'),
        ],
      ),
    );
  }
}
