
class RoomIdentity {
    int id;
    int roomTypeId;
    int roomNumber;
    DateTime createdAt;
    DateTime updatedAt;

    RoomIdentity({
        required this.id,
        required this.roomTypeId,
        required this.roomNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    factory RoomIdentity.fromJson(Map<String, dynamic> json) => RoomIdentity(
        id: json["id"],
        roomTypeId: json["room_type_id"],
        roomNumber: json["room_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_type_id": roomTypeId,
        "room_number": roomNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}