import 'package:dio/dio.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/models/characters.dart';  // افترض أنك تستخدم نموذج Character هنا

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      print(response.data.toString());

      List<dynamic> results = response.data['results'];  // استخراج النتائج من الـ response
      return results.map((item) => Character.fromJson(item)).toList();
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
