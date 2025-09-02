import 'package:abdelwahab_portfolio/models/experience_model.dart';
import 'package:abdelwahab_portfolio/models/links_model.dart';
import 'package:abdelwahab_portfolio/models/work_model.dart';

class AppDataModel {
  final LinksModel linkes;
  final List<WorkModel> works;
  final List<String> capabilities;
  final List<ExperienceModel> experience;

  AppDataModel({
    required this.linkes,
    required this.works,
    required this.capabilities,
    required this.experience,
  });

  factory AppDataModel.fromJson(Map<String, dynamic> json) => AppDataModel(
    linkes: LinksModel.fromJson(json["linkes"]),
    works: List<WorkModel>.from(
      json["works"].map((x) => WorkModel.fromJson(x)),
    ),
    capabilities: List<String>.from(json["capabilities"].map((x) => x)),
    experience: List<ExperienceModel>.from(
      json["experience"].map((x) => ExperienceModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "linkes": linkes.toJson(),
    "works": List<dynamic>.from(works.map((x) => x.toJson())),
    "capabilities": List<dynamic>.from(capabilities.map((x) => x)),
    "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
  };
}
