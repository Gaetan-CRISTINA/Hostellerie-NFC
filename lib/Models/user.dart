class User {
    String firstname;
    String lastname;
    String picture;
    String gender;
    DateTime birthDate;
    int loyalty;
    String address;
    String email;

    User({
        required this.firstname,
        required this.lastname,
        required this.picture,
        required this.gender,
        required this.birthDate,
        required this.loyalty,
        required this.address,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        picture: json["picture"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        loyalty: json["loyalty"],
        address: json["address"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "picture": picture,
        "gender": gender,
        "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "loyalty": loyalty,
        "address": address,
        "email": email,
    };
}