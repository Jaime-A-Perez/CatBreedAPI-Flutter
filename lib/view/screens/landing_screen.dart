import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pragma/blocs/bloc/cat_bloc.dart';
import 'package:test_pragma/view/widgets/card_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatBlocState>(
      builder: (context, state) {
        if (state.catList == null) {
          return Container(
          color: Colors.amber,
          child: Text("no data"),
        );
        }else {
          return Scaffold(
            body: CardCustom(
              breed: '${(state.catList?[0].breed) }', 
              countryOfOrigin: '${state.catList?[0].origin}', 
              intelligence: '${state.catList?[0].intelligence}', 
              image: '${state.catList?[0].urlImage}',   
            ),
          );
        }
        
      },
    );
  }
}
