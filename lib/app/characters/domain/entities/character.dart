import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String? id;
  final String name;
  final CharacterGender gender;
  final CharacterHouse? house;
  final CharacterSpecies species;
  final String? dateOfBirth;
  final String? yearOfBirth;
  final bool isWizard;
  final String? ancestry;
  final Wand? wand;
  final String? patronus;
  final CharacterCategory category;
  final String? actorName;
  final String? image;

  const Character({
    this.id,
    required this.name,
    required this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    required this.isWizard,
    required this.species,
    this.ancestry,
    this.wand,
    this.patronus,
    required this.category,
    this.actorName,
    this.image,
  });

  @override
  List<Object> get props => [
        id ?? '',
        name,
        gender,
        species,
        house ?? '',
        dateOfBirth ?? '',
        yearOfBirth ?? '',
        isWizard,
        ancestry ?? '',
        wand ?? '',
        patronus ?? '',
        category,
        actorName ?? '',
        image ?? '',
      ];
}

class Wand extends Equatable {
  final String wood;
  final String core;
  final String size;
  const Wand({
    required this.wood,
    required this.core,
    required this.size,
  });

  @override
  List<Object> get props => [wood, core, size];
}

enum CharacterCategory {
  staff,
  student,
  other,
}

enum CharacterGender {
  male,
  female,
  other,
}

enum CharacterHouse {
  gryffindor,
  slytherin,
  ravenclaw,
  hufflepuff,
  other,
}

enum CharacterSpecies {
  human,
  halfHuman,
  goblin,
  ghost,
  halfGiant,
  werewolf,
  cat,
  owl,
  poltergeist,
  threeHeadedDog,
  dragon,
  centaur,
  houseElf,
  acromantula,
  hippogriff,
  giant,
  other,
}
