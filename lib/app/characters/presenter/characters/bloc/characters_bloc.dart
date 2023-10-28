import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/constants/routes/routes.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_all_characters.dart';
import '../../../domain/usecases/get_characters_by_house.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  static CharactersBloc get(context) => BlocProvider.of(context);
  final GetAllCharacters _getAllCharactersUseCase;
  final GetCharactersByHouse _getCharactersByHouse;
  CharactersBloc(
    this._getAllCharactersUseCase,
    this._getCharactersByHouse,
  ) : super(const CharactersDefault([], [])) {
    on<CharactersEvent>((event, emit) async {
      if (event is FetchCharactersEvent) {
        _handleFetchCharactersEvent(state, emit);
      }
      if (event is FetchCharactersByHouseEvent) {
        _handleFetchCharactersByHouseEvent(event, state, emit);
      }
      if (event is NavigateToCharacterDetailsPageEvent) {
        _handleNavigateToCharacterDetailsPageEvent(event);
      }
    });
  }

  void _handleFetchCharactersEvent(
      CharactersState state, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());

    final characters = await _getAllCharactersUseCase.call(NoParams());
    final onScreenCharacters = characters.sublist(0, 10);

    emit(CharactersDefault(characters, onScreenCharacters));
  }

  void _handleFetchCharactersByHouseEvent(FetchCharactersByHouseEvent event,
      CharactersState state, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());

    final characters = await _getCharactersByHouse
        .call(GetCharactersByHouseParams(event.house));
    final onScreenCharacters = characters.sublist(0, 10);

    emit(CharactersDefault(characters, onScreenCharacters));
  }

  void _handleNavigateToCharacterDetailsPageEvent(
      NavigateToCharacterDetailsPageEvent event) async {
    Modular.to.pushNamed('${AppRoutesPaths.loginPath}/${event.id}');
  }
}
