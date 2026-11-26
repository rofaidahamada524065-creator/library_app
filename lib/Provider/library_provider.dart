import 'package:flutter/material.dart';
import 'package:library_app/Models/library_model.dart';
import 'package:library_app/Services/library_services.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryModel? libraryModel;
  Future<void> LibraryBooks() async {
    libraryModel = await LibraryServices.LibraryRequest();
    notifyListeners();
  }

  Future<void> Search({required String title}) async {
    libraryModel = await LibraryServices.SearchRequest(title: title);
    notifyListeners();
  }

  
}
