import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/errors/remote_client_exception.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_character_by_id.dart';
part 'character_details_state.dart';
part 'character_details_event.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  static CharacterDetailsBloc get(context) => BlocProvider.of(context);
  final GetCharacterById _getCharacterById;
  CharacterDetailsBloc(this._getCharacterById)
      : super(const CharacterDetailsDefault(Character(), false)) {
    on<CharacterDetailsEvent>((event, emit) async {
      if (event is FetchCharacterDetailsEvent) {
        await _handleFetchCharacterDetailsEvent(event, emit);
      }
      if (event is PopPageEvent) {
        _handlePopPage();
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

      emit(CharacterDetailsDefault(character, true));
    } on RemoteClientException catch (error) {
      emit(CharacterDetailsError(error.message));
    } catch (error) {
      emit(const CharacterDetailsError('Um erro inesperado ocorreu'));
    }
  }

  void _handlePopPage() => Modular.to.pop();
}
