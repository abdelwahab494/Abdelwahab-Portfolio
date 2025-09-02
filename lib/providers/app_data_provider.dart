import 'dart:convert';

import 'package:abdelwahab_portfolio/models/app_data_model.dart';
import 'package:abdelwahab_portfolio/models/experience_model.dart';
import 'package:abdelwahab_portfolio/models/links_model.dart';
import 'package:abdelwahab_portfolio/models/work_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppDataProvider extends ChangeNotifier {
  AppDataModel? _appData;
  LinksModel? _links;
  List<WorkModel>? _work;
  List<ExperienceModel>? _experience;
  List<String>? _capabilities;
  bool _isLoading = false;
  String? _error;

  AppDataModel? get appData => _appData;
  LinksModel? get links => _links;
  List<WorkModel>? get work => _work;
  List<ExperienceModel>? get experience => _experience;
  List<String>? get capabilities => _capabilities;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAppData() async {
    if (_appData != null) return;
    _isLoading = true;
    _error = null;
    notifyListeners();
    print("Loading ..");

    try {
      final response = await http.get(
        Uri.parse(
          "https://abdelwahab494.github.io/Abdelwahab-Portfolio/app_data.json",
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _appData = AppDataModel.fromJson(jsonData);
        _links = _appData?.linkes;
        _work = _appData?.works;
        _experience = _appData?.experience;
        _capabilities = _appData?.capabilities;
        print("Data loaded");
      } else {
        _error = 'Error Loading Data: ${response.statusCode}';
      }
    } catch (e) {
      _error = "Something went wrong: $e";
      print("Error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
