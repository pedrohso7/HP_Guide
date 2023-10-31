import '../../../../core/result/result.dart';
import '../entities/character.dart';

abstract class CharactersProtocols {
  Future<IResult<List<Character>>> getAllCharacters();
  Future<IResult<Character>> getCharacterById(String id);
  Future<IResult<List<Character>>> getCharactersByHouse(String house);
}
