import 'package:test_pragma/domine/entities/cat.dart';
// Abstract class representing a data source for retrieving cat data
abstract class CatDataSource{
  // Retrieve a list of cats with a specified limit
  Future<List<Cat>> getCats(int catLimit);
    // Search for a cat based on the specified breed    
  Future<Cat?> searchCat(String breed);
}