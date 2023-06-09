import '../Models/user.dart';
import '../Models/option.dart';
import '../Models/room.dart';

class Booking {
  Room room;
  User user;
  List<Option> options;
  DateTime startingDate;
  DateTime endingDate;
  String status;
  int bookingId;
  int totalPrice;
  int occupants;

  Booking({
    required this.room,
    required this.user,
    required this.options,
    required this.startingDate,
    required this.endingDate,
    required this.status,
    required this.bookingId,
    required this.totalPrice,
    required this.occupants,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        room: Room.fromJson(json["room"]),
        user: User.fromJson(json["user"]),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        startingDate: DateTime.parse(json["starting_date"]),
        endingDate: DateTime.parse(json["ending_date"]),
        status: json["status"],
        bookingId: json["booking_id"],
        totalPrice: json["total_price"],
        occupants: json["occupants"],
      );

  Map<String, dynamic> toJson() => {
        "room": room.toJson(),
        "user": user.toJson(),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "starting_date":
            "${startingDate.year.toString().padLeft(4, '0')}-${startingDate.month.toString().padLeft(2, '0')}-${startingDate.day.toString().padLeft(2, '0')}",
        "ending_date":
            "${endingDate.year.toString().padLeft(4, '0')}-${endingDate.month.toString().padLeft(2, '0')}-${endingDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "booking_id": bookingId,
        "total_price": totalPrice,
        "occupants": occupants,
      };
}






