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
  other;

  factory CharacterCategory.fromBoolValues(bool isStudent, bool isStaff) {
    if (isStudent) {
      return CharacterCategory.student;
    }
    if (isStaff) {
      return CharacterCategory.staff;
    }
    return CharacterCategory.other;
  }
}

enum CharacterGender {
  male,
  female,
  other;

  factory CharacterGender.fromString(String value) {
    switch (value) {
      case "male":
        return CharacterGender.male;
      case "female":
        return CharacterGender.female;
      default:
        return CharacterGender.other;
    }
  }
}

enum CharacterHouse {
  gryffindor('gryffindor'),
  slytherin('slytherin'),
  ravenclaw('ravenclaw'),
  hufflepuff('hufflepuff');

  final String name;
  const CharacterHouse(this.name);

  factory CharacterHouse.fromString(String value) {
    switch (value) {
      case "gryffindor":
        return CharacterHouse.gryffindor;
      case "slytherin":
        return CharacterHouse.slytherin;
      case 'ravenclaw':
        return CharacterHouse.ravenclaw;
      default:
        return CharacterHouse.hufflepuff;
    }
  }
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
  other;

  factory CharacterSpecies.fromString(String value) {
    switch (value) {
      case "human":
        return CharacterSpecies.human;
      case "half-human":
        return CharacterSpecies.halfHuman;
      case 'goblin':
        return CharacterSpecies.goblin;
      case 'ghost':
        return CharacterSpecies.ghost;
      case 'half-giant':
        return CharacterSpecies.halfGiant;
      case 'werewolf':
        return CharacterSpecies.werewolf;
      case 'cat':
        return CharacterSpecies.cat;
      case 'owl':
        return CharacterSpecies.owl;
      case 'poltergeist':
        return CharacterSpecies.poltergeist;
      case 'three-headed dog':
        return CharacterSpecies.threeHeadedDog;
      case 'dragon':
        return CharacterSpecies.dragon;
      case 'centaur':
        return CharacterSpecies.centaur;
      case 'house-elf':
        return CharacterSpecies.houseElf;
      case 'acromantula':
        return CharacterSpecies.acromantula;
      case 'hippogriff':
        return CharacterSpecies.hippogriff;
      case 'giant':
        return CharacterSpecies.giant;
      default:
        return CharacterSpecies.other;
    }
  }
}
