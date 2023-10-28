import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/characters/presenter/characters/bloc/characters_bloc.dart';
import 'core/constants/routes/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppRoutesPaths.characters);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Modular.get<CharactersBloc>()),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        title: 'HP_Guide',
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
