import 'package:cats/cats/data/cat_breeds_reporitory.dart';
import 'package:cats/cats/domain/models/weight_model.dart';
import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:flutter/material.dart';

class CatsController extends ChangeNotifier {
  /// List to store all cat breeds data from repository.
  List<CatModel> allCatBreeds = [];

  /// List to store all cat breeds data that will be shown sin screen.
  ///
  /// If user uses searchbar, this list will only contain the cat breeds
  /// that matches with search criteria.
  List<CatModel> filteredCatBreeds = [];

  /// Controller for searchbar text field.
  TextEditingController searhController = TextEditingController();

  /// Function to get all cat breeds from repository.
  Future<void> getAllCatBreeds() async {
    List<CatModel> catBreeds = await CatBreedsReporitory.getAllCatBreeds();
    allCatBreeds = catBreeds;
    filteredCatBreeds = catBreeds;
    notifyListeners();
  }

  /// Function to get a cat breed image url by cat id.
  Future<String> getCatImageUrl({required String catReferenceId}) async {
    return await CatBreedsReporitory.getCatBreedImageUrl(catReferenceId: catReferenceId);
  }

  /// Function to get the cat breed weight either in imperial system or metric system.
  String getCatWeigtht({
    required Map<String, dynamic> weight,
    WeightOptions? option,
  }) {
    WeightModel finalWeight = WeightModel.fromJson(weight);
    if (option == WeightOptions.imperial) return "${finalWeight.imperial!} lb";
    return "${finalWeight.metric!} kg";
  }

  /// Function to filter cat breeds according to search criteria obtained from the searchbar.
  void filterCats(String query) {
    filteredCatBreeds = allCatBreeds.where(
      (cat) {
        return cat.name!.toLowerCase().contains(query.toLowerCase());
      },
    ).toList();
    notifyListeners();
  }

  /// Function to clear searchbar and restore data to all cat breeds.
  void clearQuery() {
    filteredCatBreeds = allCatBreeds;
    searhController.clear();
    notifyListeners();
  }
}
