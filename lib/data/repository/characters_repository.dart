import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/web_services/character_web_services.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;
  CharactersRepository(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
