class WorkModel {
    final String imageComment;
    final String projectTitle;
    final String projectDescription;
    final String projectYear;
    final String projectRole;
    final String url;
    final List<String> images;

    WorkModel({
        required this.imageComment,
        required this.projectTitle,
        required this.projectDescription,
        required this.projectYear,
        required this.projectRole,
        required this.url,
        required this.images,
    });

    factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        imageComment: json["imageComment"],
        projectTitle: json["projectTitle"],
        projectDescription: json["projectDescription"],
        projectYear: json["projectYear"],
        projectRole: json["projectRole"],
        url: json["url"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "imageComment": imageComment,
        "projectTitle": projectTitle,
        "projectDescription": projectDescription,
        "projectYear": projectYear,
        "projectRole": projectRole,
        "url": url,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
