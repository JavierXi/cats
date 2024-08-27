import 'package:cats/cats/domain/models/cat_with_image_model.dart';
import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/http_client/http_client.dart';
import 'package:cats/http_client/urls.dart';
import 'package:dio/dio.dart';

class CatBreedsReporitory {
  static Future<List<CatModel>> getAllCatBreeds() async {
    Response response = await HttpClient().get(endpoint: AppUrl.breedsUrl);
    List<dynamic> data = response.data;
    final List<CatModel> catBreeds = data.map((cat) => CatModel.fromJson(cat)).toList();
    return catBreeds;
  }

  static Future<String> getCatBreedImageUrl({required String catReferenceId}) async {
      Response response =await HttpClient().get(endpoint: "${AppUrl.imageById}/$catReferenceId");
      Map<String, dynamic> data = response.data;
      CatWithImageModel responseData = CatWithImageModel.fromJson(data);
    return responseData.url ?? "";
  }
}