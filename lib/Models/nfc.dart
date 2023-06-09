import 'booking.dart';

class Nfc {
    Booking booking;
    String hash;
    dynamic endedAt;
    DateTime createdAt;

    Nfc({
        required this.booking,
        required this.hash,
        this.endedAt,
        required this.createdAt,
    });

    factory Nfc.fromJson(Map<String, dynamic> json) => Nfc(
        booking: Booking.fromJson(json["booking"]),
        hash: json["hash"],
        endedAt: json["ended_at"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "booking": booking.toJson(),
        "hash": hash,
        "ended_at": endedAt,
        "created_at": createdAt.toIso8601String(),
    };
}