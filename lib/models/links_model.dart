class LinksModel {
    final String linkedIn;
    final String github;
    final String facebook;
    final String whatsapp;
    final String instagram;
    final String resume;

    LinksModel({
        required this.linkedIn,
        required this.github,
        required this.facebook,
        required this.whatsapp,
        required this.instagram,
        required this.resume,
    });

    factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        linkedIn: json["LinkedIn"],
        github: json["Github"],
        facebook: json["Facebook"],
        whatsapp: json["Whatsapp"],
        instagram: json["Instagram"],
        resume: json["Resume"],
    );

    Map<String, dynamic> toJson() => {
        "LinkedIn": linkedIn,
        "Github": github,
        "Facebook": facebook,
        "Whatsapp": whatsapp,
        "Instagram": instagram,
        "Resume": resume,
    };
}