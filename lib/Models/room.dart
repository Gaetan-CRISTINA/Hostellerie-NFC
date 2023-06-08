import '../Models/room_type.dart';
import '../Models/prestation.dart';

class Room {
  int roomId;
  RoomType roomType;
  int number;
  List<Prestation> prestations;

  Room({
    required this.roomId,
    required this.roomType,
    required this.number,
    required this.prestations,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["room_id"],
        roomType: RoomType.fromJson(json["room_type"]),
        number: json["number"],
        prestations: List<Prestation>.from(
            json["prestations"].map((x) => Prestation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_type": roomType.toJson(),
        "number": number,
        "prestations": List<dynamic>.from(prestations.map((x) => x.toJson())),
      };
}
