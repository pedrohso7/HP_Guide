import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../protocols/characters_protocols.dart';

class GetAllCharacters implements UseCase<Future<List<Character>>, NoParams> {
  final CharactersProtocols repository;
  const GetAllCharacters(this.repository);

  @override
  Future<List<Character>> call(NoParams params) async {
    final IResult<List<Character>> response =
        await repository.getAllCharacters();

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }

    return (response as SuccessResult).data;
  }
}
