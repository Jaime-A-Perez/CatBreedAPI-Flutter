import 'package:test_pragma/domine/entities/cat.dart';

abstract class CatDataSource{
  Future<List<Cat>> getCats();
}