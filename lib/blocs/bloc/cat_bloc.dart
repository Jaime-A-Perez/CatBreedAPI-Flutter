import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/datasourceimp/cat_datasource_imp.dart';

part 'cat_event.dart';
part 'cat_state.dart';
 
class CatBloc extends Bloc<CatBlocEvent, CatBlocState> {
  Timer? _isTypping;
  int catLimit = 7;
  bool isLoading = false;
  
  CatBloc() : super(CatBlocState()) {
    on<InitCatBloc>((event, emit) async{      
      final List<Cat> cats = await CatDataSourceImp().getCats(catLimit);
      emit(state.copywith(catList: cats));      
    });
    
    on<SearchEvent>((event, emit) async{      
      if (isAlmostFourCharacters(event.queryParameters)){
        if (_isTypping?.isActive ?? false) return;
        final Cat? cats = await CatDataSourceImp().searchCat(event.queryParameters.toLowerCase());
        emit(state.copywith(searchResult: cats));     
        _isTypping = Timer(const Duration(milliseconds: 700), () {
    });
      }else {
        emit(state.copywith(searchResult: null));     
      }
    });

    on<AddNewItems>((event, emit) async{
      if (isLoading) return;
      isLoading = true;

      counterByTen();      

      final List<Cat> cats = await CatDataSourceImp().getCats(catLimit);
      emit(state.copywith(catList: cats));     
      await Future.delayed(const Duration(milliseconds: 200));
      isLoading = false;
    });
  }
  
    void counterByTen(){
    catLimit += 5;
  }
    bool isAlmostFourCharacters(String queryParameters){
      final bool isAlmostFourCharacter =  queryParameters.length >= 4 ? true : false;
      return isAlmostFourCharacter;
    }

} 
