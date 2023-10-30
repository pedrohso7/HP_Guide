import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/remote_client_exception.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_character_by_id.dart';
part 'character_details_state.dart';
part 'character_details_event.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  static CharacterDetailsBloc get(context) => BlocProvider.of(context);
  final GetCharacterById _getCharacterById;
  // final GetCharacterDetailsByHouse _getCharacterDetailsByHouse;
  CharacterDetailsBloc(
    this._getCharacterById,
    // this._getCharacterDetailsByHouse,
  ) : super(CharacterDetailsInitial()) {
    on<CharacterDetailsEvent>((event, emit) async {
      if (event is FetchCharacterDetailsEvent) {
        await _handleFetchCharacterDetailsEvent(event, emit);
      }
    });
  }

  Future<void> _handleFetchCharacterDetailsEvent(
      FetchCharacterDetailsEvent event,
      Emitter<CharacterDetailsState> emit) async {
    try {
      emit(CharacterDetailsLoading());

      final character =
          await _getCharacterById.call(GetCharacterByIdParams(event.id));

      emit(CharacterDetailsDefault(character));
    } on RemoteClientException catch (error) {
      emit(CharacterDetailsError(error.message));
    } catch (error) {
      emit(const CharacterDetailsError('Um erro inesperado ocorreu'));
    }
  }
}
