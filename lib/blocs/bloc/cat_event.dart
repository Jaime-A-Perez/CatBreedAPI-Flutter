part of 'cat_bloc.dart';

@immutable
abstract class CatBlocEvent {}

class InitCatBloc extends CatBlocEvent {
  InitCatBloc();
  
}
class AddNewItems extends CatBlocEvent {
  AddNewItems();
}

class SearchEvent extends CatBlocEvent {
  final String queryParameters;
  SearchEvent(this.queryParameters);  
}