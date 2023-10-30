part of 'character_details_bloc.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsInitial extends CharacterDetailsState {}

final class CharacterDetailsDefault extends CharacterDetailsState {
  final Character character;
  const CharacterDetailsDefault(
    this.character,
  );

  @override
  List<Object> get props => [character];
}

final class CharacterDetailsLoading extends CharacterDetailsState {}

final class CharacterDetailsError extends CharacterDetailsState {
  final String message;
  const CharacterDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
