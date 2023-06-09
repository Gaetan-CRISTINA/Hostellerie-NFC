class Description {
  String en;
  String fr;

  Description({
    required this.en,
    required this.fr,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
        fr: json["fr"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "fr": fr,
      };
}