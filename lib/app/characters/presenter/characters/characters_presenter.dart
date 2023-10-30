import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/widgets/default_appbar.dart';
import 'bloc/characters_bloc.dart';
import 'screens/characters_screen.dart';

class CharactersPresenter extends StatefulWidget {
  const CharactersPresenter({super.key});

  @override
  State<CharactersPresenter> createState() => _CharactersPresenter();
}

class _CharactersPresenter extends State<CharactersPresenter> {
  late CharactersBloc bloc;
  @override
  void initState() {
    bloc = CharactersBloc.get(context);
    bloc.add(FetchCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Onboard',
        withBackButton: false,
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersDefault) {
            return CharactersScreen(
              characters: state.allCharacters,
              onPressLogoutButton: () => {},
              onPressCharacter: () => {},
            );
          }
          if (state is CharactersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CharactersError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.subTitle,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
