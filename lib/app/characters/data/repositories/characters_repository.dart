import 'package:dio/dio.dart';

import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/character.dart';
import '../../domain/protocols/characters_protocols.dart';
import '../datasources/characters_remote_datasource.dart';

class CharactersRepository implements CharactersProtocols {
  final ICharactersRemoteDataSource remoteDataSource;
  const CharactersRepository(this.remoteDataSource);

  @override
  Future<IResult<List<Character>>> getAllCharacters() async {
    try {
      return SuccessResult(await remoteDataSource.getAllCharacters());
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (_) {
      return ErrorResult(RemoteClientException('Erro ao realizar consulta'));
    }
  }

  @override
  Future<IResult<Character>> getCharacterById(String id) async {
    try {
      return SuccessResult(await remoteDataSource.getCharacterById(id));
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (_) {
      return ErrorResult(RemoteClientException('Erro ao realizar consulta'));
    }
  }

  @override
  Future<IResult<List<Character>>> getCharactersByHouse(String house) async {
    try {
      return SuccessResult(await remoteDataSource.getCharactersByHouse(house));
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (_) {
      return ErrorResult(RemoteClientException('Erro ao realizar consulta'));
    }
  }
}
