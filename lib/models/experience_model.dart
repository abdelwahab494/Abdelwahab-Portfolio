class ExperienceModel {
    final String title;
    final String date;
    final String location;
    final List<String> detailes;

    ExperienceModel({
        required this.title,
        required this.date,
        required this.location,
        required this.detailes,
    });

    factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
        title: json["title"],
        date: json["date"],
        location: json["location"],
        detailes: List<String>.from(json["detailes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "location": location,
        "detailes": List<dynamic>.from(detailes.map((x) => x)),
    };
}
