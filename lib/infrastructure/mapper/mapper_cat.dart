import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/models/cat_model.dart';

class MapperCat{
  static Cat catModelToCatEntity(CatModel catModel){
    return Cat(
    breed: catModel.name,
    origin: catModel.origin,
    intelligence: catModel.intelligence.toString(),
    description: catModel.description,
    lifeSpan: catModel.lifeSpan,
    adaptability: catModel.adaptability.toString(),
    urlImage:"https://cdn2.thecatapi.com/images/${catModel.referenceImageId}.jpg",
    id: catModel.id);

  }
}