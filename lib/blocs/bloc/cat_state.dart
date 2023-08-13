part of 'cat_bloc.dart';

class CatBlocState {
  final List<Cat>? catList;
  final Cat? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  CatBlocState({this.isActiveSearch, this.searchResult, this.queryParameters, this.catList});

  CatBlocState copywith({
    List<Cat>? catList,
    Cat? searchResult,
    String? queryParameters,
    bool? isActiveSearch,  }) => CatBlocState(
    catList: catList ?? this.catList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch: isActiveSearch ?? this.isActiveSearch
  );
}
