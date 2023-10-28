import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../protocols/characters_protocols.dart';

class GetCharacterById
    implements UseCase<Future<Character>, GetCharacterByIdParams> {
  final CharactersProtocols repository;
  const GetCharacterById(this.repository);

  @override
  Future<Character> call(GetCharacterByIdParams params) async {
    final IResult<Character> response =
        await repository.getCharacterById(params.id);

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }

    return (response as SuccessResult).data;
  }
}

class GetCharacterByIdParams {
  final String id;

  GetCharacterByIdParams(
    this.id,
  );
}
