import 'package:dio/dio.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/models/characters.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      //connectTimeout: const Duration(seconds: 60),
      //receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<Character>> getFirstTenPagesCharacters() async {
    List<Character> allCharacters = []; // قائمة لجميع الشخصيات
    String url = "character"; // بداية الرابط
    int pageCount = 0; // عداد الصفحات

    try {
      while (url.isNotEmpty && pageCount < 20) { // التكرار حتى 10 صفحات كحد أقصى
        Response response = await dio.get(url); // طلب الصفحة الحالية
        print(response.data.toString());

        // إضافة الشخصيات من الصفحة الحالية إلى القائمة
        List<dynamic> results = response.data['results'];
        allCharacters.addAll(results.map((item) => Character.fromJson(item)).toList());

        // تحديث الرابط للصفحة التالية
        url = response.data['info']['next']?.replaceFirst(baseUrl, "") ?? "";
        pageCount++; // زيادة عداد الصفحات
      }
    } on Exception catch (e) {
      print(e.toString());
    }

    return allCharacters; // إعادة القائمة النهائية
  }
}
