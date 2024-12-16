import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/repository/characters_repository.dart';
import 'package:rickandmorty/data/web_services/character_web_services.dart';
import 'package:rickandmorty/presentation/screens/character_details_screen.dart';
import 'package:rickandmorty/presentation/screens/characters_screen.dart';
import 'package:rickandmorty/constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
