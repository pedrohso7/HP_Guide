part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class FetchCharactersEvent extends CharactersEvent {}

class FetchCharactersByHouseEvent extends CharactersEvent {
  final CharacterHouse house;
  const FetchCharactersByHouseEvent(this.house);
}

class SearchCharactersByName extends CharactersEvent {
  final String value;
  const SearchCharactersByName(this.value);
}

class NavigateToCharacterDetailsPageEvent extends CharactersEvent {
  final String id;
  const NavigateToCharacterDetailsPageEvent(this.id);
}
