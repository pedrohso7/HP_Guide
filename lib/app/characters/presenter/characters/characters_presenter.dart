import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_guide/core/constants/theme/colors.dart';

import '../../../../core/constants/theme/sizes.dart';
import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/widgets/default_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_text_input.dart';
import '../../domain/entities/character.dart';
import 'bloc/characters_bloc.dart';
import 'screens/characters_result_screen.dart';
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

  void fetchCharacters() => bloc.add(FetchCharactersEvent());

  void onSearch(String value) => bloc.add(SearchCharactersByName(value));

  void onPressCard(String id) =>
      bloc.add(NavigateToCharacterDetailsPageEvent(id));

  void onPressSeeAllButton(List<Character> characters) =>
      bloc.add(NavigateToCharacterSectionPageEvent(characters));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const DefaultAppbar(
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
                    onTapCharacter: onPressCard,
                    onPressSeeAllButton: onPressSeeAllButton,
                  );
                }
                if (state is CharactersSearch) {
                  return CharactersSearchScreen(
                    characters: state.onScreenCharacters,
                    onTapCharacter: onPressCard,
                  );
                }
                if (state is CharactersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  );
                }
                if (state is CharactersError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        style: AppTextStyles.subtitle,
                      ),
                      VerticalSpace.s16,
                      DefaultButton(
                        onPressed: fetchCharacters,
                        label: 'Tentar novamente',
                      ),
                    ],
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
