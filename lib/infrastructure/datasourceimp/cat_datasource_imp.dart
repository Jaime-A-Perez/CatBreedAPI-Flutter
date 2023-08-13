import 'dart:ffi';

import 'package:test_pragma/config/constants/constants.dart';
import 'package:test_pragma/domine/datasources/cat_datasource.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/mapper/mapper_cat.dart';
import 'package:test_pragma/infrastructure/models/cat_model.dart';
import 'package:http/http.dart' as http;

class CatDataSourceImp extends CatDataSource {


  Future<List<CatModel>> _response(int catLimit) async{
    final Uri uri = Uri(
        scheme: 'https',
        host: 'api.thecatapi.com',
        path: '/v1/breeds',
        queryParameters:  {'limit': "$catLimit"});

    final response = await http.get(uri, headers: {'x-api-key': Constants.apiKey});
    
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("Error code: ${response.statusCode}");
    }    

    final List<CatModel> catModel = catFromJson(response.body);
    return catModel; 
  }
  
  @override
  Future<List<Cat>> getCats(int catLimit) async{
    final resultModel = await _response(catLimit);
    final List<Cat> cats = resultModel.map((CatModel catModel) => MapperCat.catModelToCatEntity(catModel)).toList();
        // throw UnimplementedError();
    return cats;
  }  


}