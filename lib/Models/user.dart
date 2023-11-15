class User {
    String firstname;
    String lastname;
    String picture;
    String gender;
    int loyalty;
    String address;
    String email;

    User({
        required this.firstname,
        required this.lastname,
        required this.picture,
        required this.gender,
        required this.loyalty,
        required this.address,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        picture: json["picture"],
        gender: json["gender"],
        loyalty: json["loyalty"],
        address: json["address"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "picture": picture,
        "gender": gender,
        "loyalty": loyalty,
        "address": address,
        "email": email,
    };
}