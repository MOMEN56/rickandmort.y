import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/web_services/character_web_services.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  // Constructor
  CharactersRepository(this.characterWebServices);

  // لا حاجة لتحويل البيانات مرة أخرى لأن getAllCharacters في CharacterWebServices ترجع قائمة من Character
  Future<List<Character>> getAllCharacters() async {
    return await characterWebServices.getAllCharacters();
  }
}
