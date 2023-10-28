import 'dart:convert';

import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel(
    final String? id,
    final String name,
    final CharacterGender gender,
    final CharacterHouse? house,
    final CharacterSpecies species,
    final String? dateOfBirth,
    final String? yearOfBirth,
    final bool isWizard,
    final String? ancestry,
    final Wand? wand,
    final String? patronus,
    final CharacterCategory category,
    final String? actorName,
    final String? image,
  ) : super(
          id: id,
          name: name,
          gender: gender,
          house: house,
          species: species,
          dateOfBirth: dateOfBirth,
          yearOfBirth: yearOfBirth,
          isWizard: isWizard,
          ancestry: ancestry,
          wand: wand,
          patronus: patronus,
          category: category,
          actorName: actorName,
          image: image,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'species': species,
      'gender': gender,
      'house': house,
      'dateOfBirth': dateOfBirth,
      'yearOfBirth': yearOfBirth,
      'wizard': isWizard,
      'ancestry': ancestry,
      'wand': {
        'wood': wand?.wood,
        'core': wand?.core,
        'length': wand?.size,
      },
      'patronus': patronus,
      'hogwartsStudent': category == CharacterCategory.student,
      'hogwartsStaff': category == CharacterCategory.student,
      'actor': actorName,
      'image': image,
    };
  }

  factory CharacterModel.fromMap(Map map) {
    CharacterHouse getCharacterHouse(String value) {
      final stringMap = <String, CharacterHouse>{
        'ravenclaw': CharacterHouse.ravenclaw,
        'gryffindor': CharacterHouse.gryffindor,
        'slytherin': CharacterHouse.slytherin,
        'hufflepuff': CharacterHouse.hufflepuff,
      };

      return stringMap[value] ?? CharacterHouse.other;
    }

    CharacterGender getCharacterGender(String value) {
      final stringMap = <String, CharacterGender>{
        'male': CharacterGender.male,
        'female': CharacterGender.female,
      };

      return stringMap[value] ?? CharacterGender.other;
    }

    CharacterCategory getCharacterCategory(bool isStudent, bool isStaff) {
      if (isStudent) {
        return CharacterCategory.student;
      }
      if (isStaff) {
        return CharacterCategory.staff;
      }
      return CharacterCategory.other;
    }

    CharacterSpecies getCharacterSpecies(String value) {
      final stringMap = <String, CharacterSpecies>{
        'human': CharacterSpecies.human,
        'half-human': CharacterSpecies.halfHuman,
        'goblin': CharacterSpecies.goblin,
        'ghost': CharacterSpecies.ghost,
        'half-giant': CharacterSpecies.halfGiant,
        'werewolf': CharacterSpecies.werewolf,
        'cat': CharacterSpecies.cat,
        'owl': CharacterSpecies.owl,
        'poltergeist': CharacterSpecies.poltergeist,
        'three-headed dog': CharacterSpecies.poltergeist,
        'dragon': CharacterSpecies.dragon,
        'centaur': CharacterSpecies.centaur,
        'house-elf': CharacterSpecies.houseElf,
        'acromantula': CharacterSpecies.acromantula,
        'hippogriff': CharacterSpecies.hippogriff,
        'giant': CharacterSpecies.giant
      };

      return stringMap[value] ?? CharacterSpecies.other;
    }

    return CharacterModel(
      map["id"],
      map["name"],
      getCharacterGender(map["gender"]),
      getCharacterHouse(map["house"]),
      getCharacterSpecies(map['species']),
      map["dateOfBirth"],
      map["yearOfBirth"],
      map["wizard"],
      map["ancestry"],
      map["wand"],
      map["patronus"],
      getCharacterCategory(
        map['hogwartsStudent'],
        map['hogwartsStaff'],
      ),
      map["actor"],
      map["image"],
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
