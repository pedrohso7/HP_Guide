part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersDefault extends CharactersState {
  final List<Character> allCharacters;
  const CharactersDefault(
    this.allCharacters,
  );

  @override
  List<Object> get props => [allCharacters];
}

final class CharactersSearch extends CharactersState {
  final List<Character> allCharacters;
  final List<Character> onScreenCharacters;
  const CharactersSearch(
    this.allCharacters,
    this.onScreenCharacters,
  );

  @override
  List<Object> get props => [allCharacters, onScreenCharacters];
}

final class CharactersLoading extends CharactersState {}

final class CharactersError extends CharactersState {
  final String message;
  const CharactersError(this.message);

  @override
  List<Object> get props => [message];
}
