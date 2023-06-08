class Prestation {
  int id;
  String name;
  String mediaUrl;
  String mediaAlt;

  Prestation({
    required this.id,
    required this.name,
    required this.mediaUrl,
    required this.mediaAlt,
  });

  factory Prestation.fromJson(Map<String, dynamic> json) => Prestation(
        id: json["id"],
        name: json["name"],
        mediaUrl: json["media_url"],
        mediaAlt: json["media_alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "media_url": mediaUrl,
        "media_alt": mediaAlt,
      };
}