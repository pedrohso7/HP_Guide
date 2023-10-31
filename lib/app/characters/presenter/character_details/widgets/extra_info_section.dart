import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/widgets/section_card.dart';
import '../../../domain/entities/character.dart';

class ExtraInfoSection extends StatelessWidget {
  const ExtraInfoSection({
    super.key,
    required this.character,
  });

  final Character character;

  String getGenderText(CharacterGender gender) {
    final map = <CharacterGender, String>{
      CharacterGender.female: 'Feminino',
      CharacterGender.male: 'Masculino',
      CharacterGender.other: 'Outro',
    };

    return map[gender] ?? 'Outro';
  }

  String getSpeciesText(CharacterSpecies species) {
    final map = <CharacterSpecies, String>{
      CharacterSpecies.human: 'Humano',
      CharacterSpecies.halfGiant: 'Meio Gigante',
      CharacterSpecies.halfHuman: 'Meio Humano',
      CharacterSpecies.goblin: 'Goblin',
      CharacterSpecies.ghost: 'Fantasma',
      CharacterSpecies.werewolf: 'Lobisomem',
      CharacterSpecies.cat: 'Gato',
      CharacterSpecies.owl: 'Coruja',
      CharacterSpecies.poltergeist: 'Poltergeist',
      CharacterSpecies.threeHeadedDog: 'Cachorro de Três Cabeças',
      CharacterSpecies.dragon: 'Dragão',
      CharacterSpecies.centaur: 'Centauro',
      CharacterSpecies.houseElf: 'Elfo Doméstico',
      CharacterSpecies.acromantula: 'Acromântula',
      CharacterSpecies.hippogriff: 'Hipogrifo',
      CharacterSpecies.giant: 'Gigante',
      CharacterSpecies.other: 'Outro',
    };

    return map[species] ?? 'Outro';
  }

  String getMageText(bool isWizard) => isWizard ? 'Sim' : 'Não';

  String getCategoryText(CharacterCategory category) {
    final map = <CharacterCategory, String>{
      CharacterCategory.student: 'Estudante',
      CharacterCategory.staff: 'Funcionário',
      CharacterCategory.other: 'Outro',
    };

    return map[category] ?? 'Outro';
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Informações extras',
      isImageVisible: true,
      image: AppImages.info,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(mapKey: 'Mago', value: getMageText(character.isWizard!)),
          InfoRow(
              mapKey: 'Categoria', value: getCategoryText(character.category!)),
          InfoRow(mapKey: 'Gênero', value: getGenderText(character.gender!)),
          InfoRow(mapKey: 'Espécie', value: getSpeciesText(character.species!)),
          InfoRow(mapKey: 'Ancestralidade', value: character.ancestry!),
          InfoRow(
              mapKey: 'Ano de nascimento',
              value: character.yearOfBirth != null
                  ? character.yearOfBirth.toString()
                  : ''),
          InfoRow(mapKey: 'Patrono', value: character.patronus!),
          InfoRow(mapKey: 'Nome do ator', value: character.actorName!),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String mapKey;
  final String value;
  const InfoRow({
    super.key,
    required this.mapKey,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.isNotEmpty,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mapKey,
                style: AppTextStyles.defaultTextBold,
              ),
              Text(
                value,
                style: AppTextStyles.defaultText,
              ),
            ],
          ),
          VerticalSpace.s8,
        ],
      ),
    );
  }
}
