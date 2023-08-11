
class Owner {
  String face;
  int mid;
  String name;

  Owner({
    required this.face,
    required this.mid,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    face: json["face"],
    mid: json["mid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "face": face,
    "mid": mid,
    "name": name,
  };
}