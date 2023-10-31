import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../protocols/characters_protocols.dart';

class GetCharactersByHouse
    implements UseCase<Future<List<Character>>, GetCharactersByHouseParams> {
  final CharactersProtocols repository;
  const GetCharactersByHouse(this.repository);

  @override
  Future<List<Character>> call(GetCharactersByHouseParams params) async {
    final IResult<List<Character>> response =
        await repository.getCharactersByHouse(params.house.name);

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }

    return (response as SuccessResult).data;
  }
}

class GetCharactersByHouseParams {
  final CharacterHouse house;

  GetCharactersByHouseParams(
    this.house,
  );
}
