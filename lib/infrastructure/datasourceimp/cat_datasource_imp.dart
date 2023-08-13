import 'dart:ffi';

import 'package:test_pragma/config/constants/constants.dart';
import 'package:test_pragma/domine/datasources/cat_datasource.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/mapper/mapper_cat.dart';
import 'package:test_pragma/infrastructure/models/cat_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_pragma/infrastructure/models/search_model.dart';

class CatDataSourceImp extends CatDataSource {

  Future<List<CatModel>> _response(Map<String,String> queryParameters, ) async{
    final Uri uri = Uri(
        scheme: 'https',
        host: 'api.thecatapi.com',
        path: '/v1/breeds',
        queryParameters: queryParameters);

    final response = await http.get(uri, headers: {'x-api-key': Constants.apiKey});
    
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("Error code: ${response.statusCode}");
    }    

    final List<CatModel> catModel = catFromJson(response.body);
    return catModel; 
  }
  

   Future<List<Breed>> _responseSearch(Map<String,String> queryParameters, ) async{
    final Uri uri = Uri(
        scheme: 'https',
        host: 'api.thecatapi.com',
        path: '/v1/images/search',
        queryParameters: queryParameters);

    final response = await http.get(uri, headers: {'x-api-key': Constants.apiKey});
    
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("Error code: ${response.statusCode}");
    }    

    final List<Breed> breed = breedFromJson(response.body);
    return breed; 
  }
  

  @override
  Future<List<Cat>> getCats(int catLimit) async{
    final resultModel = await _response({'limit': "$catLimit"});
    final List<Cat> cats = resultModel.map((CatModel catModel) => MapperCat.catModelToCatEntity(catModel)).toList();
    return cats;
  } 

   @override
  Future<Cat?> searchCat(String breed) async{
    final resultSearch = await _responseSearch({'breed_ids': breed});
    final List<Cat?> cats = resultSearch.map((Breed breed) => MapperCat.catModelToCatEntity(breed.breeds!.first)).toList();
    return cats.isEmpty ? null : cats.first;

    
  }  
}