import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/datasourceimp/cat_datasource_imp.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatBlocEvent, CatBlocState> {

  int catLimit = 7;
  bool isLoading = false;
  
  CatBloc() : super(CatBlocState()) {
    on<InitCatBloc>((event, emit) async{      
      final List<Cat> cats = await CatDataSourceImp().getCats(catLimit);
      emit(state.copywith(catList: cats));      
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
}
