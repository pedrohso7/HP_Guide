part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchCharacterDetailsEvent extends CharacterDetailsEvent {
  final String id;
  const FetchCharacterDetailsEvent(this.id);
}
