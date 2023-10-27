import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../usecases/get_character_by_id.dart';
import '../usecases/get_characters_by_house.dart';

abstract class CharactersProtocols {
  Future<IResult<List<Character>>> getAllCharacters(NoParams params);
  Future<IResult<Character>> getCharacterById(GetCharacterByIdParams params);
  Future<IResult<List<Character>>> getCharactersByHouse(
      GetCharactersByHouseParams params);
}
