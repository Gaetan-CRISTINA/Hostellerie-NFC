import 'dart:convert';

DoorResponse doorResponseFromJson(String str) => DoorResponse.fromJson(json.decode(str));

String doorResponseToJson(DoorResponse data) => json.encode(data.toJson());

class DoorResponse {
  bool open;
  String error;

  DoorResponse({
    required this.open,
    required this.error,
  });

  factory DoorResponse.fromJson(Map<String, dynamic> json) => DoorResponse(
    open: json["open"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "open": open,
    "error": error,
  };
}