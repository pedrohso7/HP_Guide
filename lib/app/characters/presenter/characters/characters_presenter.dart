import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/theme/sizes.dart';
import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/widgets/default_appbar.dart';
import '../../../../core/widgets/default_text_input.dart';
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

  void onSearch(String value) => bloc.add(SearchCharactersByName(value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Onboard',
        withBackButton: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppSizes.s16,
              right: AppSizes.s16,
              left: AppSizes.s16,
            ),
            child: DefaultTextInput(
              label: 'Digite o nome...',
              onChange: onSearch,
            ),
          ),
          Expanded(
            child: BlocBuilder<CharactersBloc, CharactersState>(
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
          ),
        ],
      ),
    );
  }
}
