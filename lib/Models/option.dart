import '../Models/description.dart';

class Option {
  int id;
  Description name;
  Description description;
  String type;
  int price;
  DateTime createdAt;
  DateTime updatedAt;

  Option({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: Description.fromJson(json["name"]),
        description: Description.fromJson(json["description"]),
        type: json["type"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "description": description.toJson(),
        "type": type,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
