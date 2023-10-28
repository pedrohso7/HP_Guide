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
    return CharacterModel(
      map["id"],
      map["name"],
      CharacterGender.fromString(map["gender"]),
      CharacterHouse.fromString(map["house"]),
      CharacterSpecies.fromString(map['species']),
      map["dateOfBirth"],
      map["yearOfBirth"],
      map["wizard"],
      map["ancestry"],
      map["wand"],
      map["patronus"],
      CharacterCategory.fromBoolValues(
          map['hogwartsStudent'], map['hogwartsStaff']),
      map["actor"],
      map["image"],
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
