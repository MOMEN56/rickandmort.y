class Character {
  late String charId;
  late String name;
  late String islive;
  late String species;
  late String gender;
  late String image;
  late List<String> episodes;
  late String url;
  Character.fromJson(Map<String, dynamic> json) {
    charId = json["id"];
    name = json["name"];
    islive = json["status"];
    species = json["species"];
    image = json["image"];
    episodes = json["episode"];
    url = json["url"];
  }
}
