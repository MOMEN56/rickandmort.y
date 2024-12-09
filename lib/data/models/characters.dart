class Character {
  late String charId;
  late String name;
  late String islive;
  late String species;
  late String gender;
  late String image;
  late List<String> episodes;
  late String url;

  // Constructor to parse JSON
  Character.fromJson(Map<String, dynamic> json) {
    charId = json["id"].toString(); // تحويل id إلى String إذا كان العدد
    name = json["name"];
    islive = json["status"];  // يمكنك تحسينها إذا أردت تحويلها إلى boolean
    species = json["species"];
    gender = json["gender"];  // تأكد من وجود هذا الحقل إذا كان من الضروري
    image = json["image"];
    // التأكد من أن episodes هي قائمة من String
    episodes = List<String>.from(json["episode"] ?? []);
    url = json["url"];
  }
}
