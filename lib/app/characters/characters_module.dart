import 'package:flutter_modular/flutter_modular.dart';

import '../../core/constants/routes/routes.dart';
import '../../core/platform/hp_api_client.dart';
import 'data/datasources/characters_remote_datasource.dart';
import 'data/repositories/characters_repository.dart';
import 'domain/protocols/characters_protocols.dart';
import 'domain/usecases/get_all_characters.dart';
import 'domain/usecases/get_character_by_id.dart';
import 'domain/usecases/get_characters_by_house.dart';
import 'presenter/character_details/bloc/character_details_bloc.dart';
import 'presenter/character_details/character_details_presenter.dart';
import 'presenter/characters/bloc/characters_bloc.dart';
import 'presenter/characters/characters_presenter.dart';

class CharactersModule extends Module {
  @override
  void binds(i) {
    //Data Sources
    i.addLazySingleton<ICharactersRemoteDataSource>(
      () => CharactersRemoteDataSource(
        Modular.get<IHPApiClient>(),
      ),
    );

    //Repositories
    i.addLazySingleton<CharactersProtocols>(
      () => CharactersRepository(
        Modular.get<ICharactersRemoteDataSource>(),
      ),
    );

    //UseCases
    i.addLazySingleton(
      () => GetAllCharacters(
        Modular.get<CharactersProtocols>(),
      ),
    );
    i.addLazySingleton(
      () => GetCharacterById(
        Modular.get<CharactersProtocols>(),
      ),
    );
    i.addLazySingleton(
      () => GetCharactersByHouse(
        Modular.get<CharactersProtocols>(),
      ),
    );

    //BLoC's
    i.addLazySingleton(
      () => CharactersBloc(
        Modular.get<GetAllCharacters>(),
      ),
    );
    i.addLazySingleton(
      () => CharacterDetailsBloc(
        Modular.get<GetCharacterById>(),
      ),
    );
  }

  // Aqui estarão as rotas do seu módulo
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const CharactersPresenter());
    r.child(AppRoutesNames.characterDetails,
        child: (_) => CharacterDetailsPresenter(id: r.args.params['id']));
  }
}
