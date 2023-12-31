import 'package:dio/dio.dart';

import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/platform/hp_api_client.dart';
import '../../domain/entities/character.dart';
import '../models/character_model.dart';

abstract class ICharactersRemoteDataSource {
  Future<List<Character>> getAllCharacters();
  Future<Character> getCharacterById(String id);
  Future<List<Character>> getCharactersByHouse(String house);
}

class CharactersRemoteDataSource implements ICharactersRemoteDataSource {
  final IHPApiClient client;
  const CharactersRemoteDataSource(this.client);

  @override
  Future<List<Character>> getAllCharacters() async {
    try {
      final Response result = await client.dio.get('characters');

      List<Character> characters = [];
      for (final character in result.data) {
        characters.add(CharacterModel.fromMap(character));
      }

      return characters;
    } catch (_) {
      throw RemoteClientException('Erro ao realizar consulta');
    }
  }

  @override
  Future<Character> getCharacterById(String id) async {
    try {
      final Response result = await client.dio.get('character/$id');

      return CharacterModel.fromMap(result.data[0]);
    } catch (_) {
      throw RemoteClientException('Erro ao realizar consulta');
    }
  }

  @override
  Future<List<Character>> getCharactersByHouse(String house) async {
    try {
      final Response result = await client.dio.get('characters/house/$house');
      final characters = result.data.map((character) {
        CharacterModel.fromMap(character);
      }).toList();
      return characters;
    } catch (_) {
      throw RemoteClientException('Erro ao realizar consulta');
    }
  }
}
