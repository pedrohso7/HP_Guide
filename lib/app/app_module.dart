import 'package:flutter_modular/flutter_modular.dart';

import '../core/constants/routes/routes.dart';
import '../core/platform/hp_api_client.dart';
import 'characters/characters_module.dart';

class AppModule extends Module {
  // Injeções globais
  @override
  void binds(i) {
    i.addLazySingleton<IHPApiClient>(() => HPApiClient());
  }

  // Rotas
  @override
  void routes(r) {
    r.module(AppRoutesNames.characters, module: CharactersModule());
  }
}
