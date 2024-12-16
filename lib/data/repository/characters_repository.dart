import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/web_services/character_web_services.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  // Constructor
  CharactersRepository(this.characterWebServices);

  // استدعاء الطريقة الصحيحة من CharacterWebServices
  Future<List<Character>> getAllCharacters() async {
    return await characterWebServices.getFirstTenPagesCharacters(); // استدعاء الطريقة الصحيحة
  }
}
