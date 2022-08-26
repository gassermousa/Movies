class Cast {
  int? id;
  String? character;
  String? name;
  String? img;

  Cast.fromJson(Map<String, dynamic> json) {
    id = json["cast_id"];
    character = json["character"];
    name = json["name"];
    img = json["profile_path"] ?? 'assets/image/cast_placeholder.png';
  }
}
