class DoaHarian {
  DoaHarian({
    this.title,
    this.arabic,
    this.latin,
    this.translation,
  });

  String? title;
  String? arabic;
  String? latin;
  String? translation;

  factory DoaHarian.fromJson(Map<String, dynamic> json) => DoaHarian(
        title: json["title"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}
