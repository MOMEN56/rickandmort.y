class Character {
  late String charId;
  late String name;
  late String islive;
  late String species;
  late String gender;
  late String image;
  late List<String> episodes;
  late String url;
  late String origin;
  late String location;
  Character.fromJson(Map<String, dynamic> json) {
    charId = json["id"].toString();
    name = json["name"];
    islive = json["status"];
    species = json["species"];
    gender = json["gender"];
    image = json["image"];
    location = json["location"]["name"];
    origin = json["origin"]["name"];
    episodes = List<String>.from(json["episode"] ?? []);
    url = json["url"];
  }
}

