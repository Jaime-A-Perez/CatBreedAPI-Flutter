import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pragma/blocs/bloc/cat_bloc.dart';
import 'package:test_pragma/view/screens/detail_screen.dart';
import 'package:test_pragma/view/widgets/appBar_widget.dart';
import 'package:test_pragma/view/widgets/card_widget.dart';
import 'package:test_pragma/view/widgets/search_widget.dart';

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
     final theme = Theme.of(context);
     final bloc = context.read<CatBloc>();
    return BlocBuilder<CatBloc, CatBlocState>(
      builder: (context, state) {
        if (state.catList == null) {
          return const Center(          
          child: Text("no data"),
        );
        }else {
          return Scaffold(
            backgroundColor: Colors.blueGrey[100],
            appBar: AppBarCat(title: "Catbreeds"),
            body: SafeArea (
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SearchWidget(
                        onChanged: (value) {
                          bloc.add(SearchEvent(value));
                        },
                        ),
                    ),
                    state.searchResult != null ? CardCustom(
                              breed: (state.searchResult!.breed), 
                              countryOfOrigin: state.searchResult!.origin, 
                              intelligence: state.searchResult!.intelligence, 
                              image: state.searchResult!.urlImage,
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                 return DetailScreen(cat: state.searchResult); 
                              } )),   
                            ) : Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: state.catList!.length,
                        itemBuilder: (context, int i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            child: CardCustom(
                              breed: '${(state.catList?[i].breed) }', 
                              countryOfOrigin: '${state.catList?[i].origin}', 
                              intelligence: '${state.catList?[i].intelligence}', 
                              image: '${state.catList?[i].urlImage}',
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                 return DetailScreen(cat: state.catList![i]); 
                              } )),   
                            ),
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
