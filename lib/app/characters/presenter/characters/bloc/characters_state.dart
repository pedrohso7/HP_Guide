part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersDefault extends CharactersState {
  final List<Character> allCharacters;
  final List<Character> onScreenCharacters;
  const CharactersDefault(
    this.allCharacters,
    this.onScreenCharacters,
  );
}

final class CharactersLoading extends CharactersState {}

final class CharactersError extends CharactersState {
  final String message;
  const CharactersError(this.message);

  @override
  List<Object> get props => [message];
}
