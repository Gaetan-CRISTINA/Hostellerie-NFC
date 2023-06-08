class RoomType {
  int id;
  String name;
  String description;
  int capacity;
  int price;
  String mediaUrl;
  String mediaAlt;

  RoomType({
    required this.id,
    required this.name,
    required this.description,
    required this.capacity,
    required this.price,
    required this.mediaUrl,
    required this.mediaAlt,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        capacity: json["capacity"],
        price: json["price"],
        mediaUrl: json["media_url"],
        mediaAlt: json["media_alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "capacity": capacity,
        "price": price,
        "media_url": mediaUrl,
        "media_alt": mediaAlt,
      };
}