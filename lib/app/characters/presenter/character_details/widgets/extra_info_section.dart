import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
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
    return Container(
      padding: const EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 5,
            offset: const Offset(0, 3),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Informações extras',
          ),
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

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: AppSizes.s40,
              height: AppSizes.s40,
              child: Image.asset(
                AppImages.info,
                fit: BoxFit.contain,
              ),
            ),
            HorizontalSpace.s16,
            Text(
              title,
              // style: context.displayMedium?.copyWith(
              //   color: AppColors.pageTitle,
              // ),
            ),
          ],
        ),
        VerticalSpace.s8,
        const Divider(),
      ],
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
              Text(mapKey),
              Text(value),
            ],
          ),
          VerticalSpace.s8,
        ],
      ),
    );
  }
}
