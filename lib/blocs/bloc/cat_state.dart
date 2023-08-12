part of 'cat_bloc.dart';

class CatBlocState {
  final List<Cat>? catList;

  CatBlocState({this.catList});

  CatBlocState copywith({List<Cat>? catList}) => CatBlocState(
    catList: catList ?? this.catList
  );
}
