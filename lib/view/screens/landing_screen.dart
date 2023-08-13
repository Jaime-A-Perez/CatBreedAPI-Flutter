import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pragma/blocs/bloc/cat_bloc.dart';
import 'package:test_pragma/view/widgets/card_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels + 300 >= 
      scrollController.position.maxScrollExtent &&
      scrollController.position.pixels  <= 
      scrollController.position.maxScrollExtent
      ){
       final bloc = context.read<CatBloc>();
       bloc.add(AddNewItems());
      };
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatBlocState>(
      builder: (context, state) {
        if (state.catList == null) {
          return const Center(          
          child: Text("no data"),
        );
        }else {
          return Scaffold(
            body: SafeArea (
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: state.catList!.length,
                        itemBuilder: (context, int i) {
                          return CardCustom(
                            breed: '${(state.catList?[i].breed) }', 
                            countryOfOrigin: '${state.catList?[i].origin}', 
                            intelligence: '${state.catList?[i].intelligence}', 
                            image: '${state.catList?[i].urlImage}',   
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }        
      },
    );
  }
}
