// ignore_for_file: file_names

class LoginResponse {
    bool status;
    String message;
    String token;

    LoginResponse({
        required this.status,
        required this.message,
        required this.token,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
    };
}
