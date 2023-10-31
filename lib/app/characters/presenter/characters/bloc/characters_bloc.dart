import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/errors/remote_client_exception.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/constants/routes/routes.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_all_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  static CharactersBloc get(context) => BlocProvider.of(context);
  final GetAllCharacters _getAllCharactersUseCase;
  CharactersBloc(
    this._getAllCharactersUseCase,
  ) : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) async {
      if (event is FetchCharactersEvent) {
        await _handleFetchCharactersEvent(emit);
      }
      if (event is SearchCharactersByName) {
        await _handleSearchCharactersByName(event, state, emit);
      }
      if (event is NavigateToCharacterDetailsPageEvent) {
        _handleNavigateToCharacterDetailsPageEvent(event);
      }
      if (event is NavigateToCharacterSectionPageEvent) {
        _handleNavigateToCharacterSectionPageEvent(
            state as CharactersDefault, event);
      }
    });
  }

  Future<void> _handleFetchCharactersEvent(
      Emitter<CharactersState> emit) async {
    try {
      emit(CharactersLoading());

      final characters = await _getAllCharactersUseCase.call(NoParams());

      emit(CharactersDefault(characters));
    } on RemoteClientException catch (error) {
      emit(CharactersError(error.message));
    } catch (error) {
      emit(const CharactersError('Um erro inesperado ocorreu'));
    }
  }

  Future<void> _handleSearchCharactersByName(SearchCharactersByName event,
      CharactersState state, Emitter<CharactersState> emit) async {
    try {
      List<Character> onScreenCharacters = [];

      if (state is CharactersDefault) {
        final allCharacters = state.allCharacters;

        onScreenCharacters = allCharacters
            .where((element) =>
                element.name!.toLowerCase().contains(event.value.toLowerCase()))
            .toList();
        emit(CharactersSearch(allCharacters, onScreenCharacters));
        return;
      }

      if (state is CharactersSearch) {
        final allCharacters = state.allCharacters;
        if (event.value.isEmpty) {
          emit(CharactersDefault(allCharacters));
          return;
        }

        onScreenCharacters = allCharacters
            .where((element) =>
                element.name!.toLowerCase().contains(event.value.toLowerCase()))
            .toList();
        emit(CharactersSearch(allCharacters, onScreenCharacters));
      }
    } on RemoteClientException catch (error) {
      emit(CharactersError(error.message));
    } catch (error) {
      emit(const CharactersError('Um erro inesperado ocorreu'));
    }
  }

  Future<void> _handleNavigateToCharacterDetailsPageEvent(
      NavigateToCharacterDetailsPageEvent event) async {
    Modular.to.pushNamed('${AppRoutesPaths.characterDetails}/${event.id}');
  }

  Future<void> _handleNavigateToCharacterSectionPageEvent(
      CharactersDefault state,
      NavigateToCharacterSectionPageEvent event) async {
    Modular.to.pushNamed(AppRoutesPaths.charactersSection,
        arguments: event.characters);
  }
}
