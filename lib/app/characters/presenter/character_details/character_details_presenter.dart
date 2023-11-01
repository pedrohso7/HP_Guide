import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/widgets/default_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import 'bloc/character_details_bloc.dart';
import 'screens/character_details_screen.dart';

class CharacterDetailsPresenter extends StatefulWidget {
  const CharacterDetailsPresenter({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<CharacterDetailsPresenter> createState() =>
      _CharacterDetailsPresenter();
}

class _CharacterDetailsPresenter extends State<CharacterDetailsPresenter> {
  late CharacterDetailsBloc bloc;
  @override
  void initState() {
    bloc = CharacterDetailsBloc.get(context);
    bloc.add(FetchCharacterDetailsEvent(widget.id));
    super.initState();
  }

  void onTapBack() => bloc.add(PopPageEvent());

  void fetchCharacters() => bloc.add(FetchCharacterDetailsEvent(widget.id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppbar(
        title: 'Detalhes',
        onPressBackButton: onTapBack,
      ),
      body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsDefault) {
            return CharacterDetailsScreen(
              character: state.character,
              startAnimation: state.startAnimation,
            );
          }
          if (state is CharacterDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (state is CharacterDetailsError) {
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
    );
  }
}
