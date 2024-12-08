import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).character;
          return BuildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget BuildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
         shrinkWrap: true,
         physics: const ClampingScrollPhysics(),
         padding: EdgeInsets.zero,
         itemCount: allCharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(character: allCharacters[index],);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
    );
  }
}
