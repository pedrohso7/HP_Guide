import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/theme/text_style.dart';
import '../../../../core/widgets/default_appbar.dart';
import 'bloc/character_details_bloc.dart';
import 'screens/character_details_presenter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Onboard',
        withBackButton: false,
      ),
      body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsDefault) {
            return CharacterDetailsScreen(
              character: state.character,
            );
          }
          if (state is CharacterDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CharacterDetailsError) {
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
