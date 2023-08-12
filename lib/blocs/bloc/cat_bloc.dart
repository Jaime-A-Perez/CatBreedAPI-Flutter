import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/infrastructure/datasourceimp/cat_datasource_imp.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatBlocEvent, CatBlocState> {
  CatBloc() : super(CatBlocState()) {
    on<CatBlocEvent>((event, emit) async{
      
      final List<Cat> cats = await CatDataSourceImp().getCats();
      emit(state.copywith(catList: cats));
      print(state.catList);
    });
  }
}
