import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pragma/blocs/bloc/cat_bloc.dart';
import 'package:test_pragma/config/routes/routes.dart';
import 'package:test_pragma/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CatBloc()..add(InitCatBloc()),
        lazy: false,
        )
      ],
      child: MaterialApp(
          title: 'CatsBreeds',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          routes: routes,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(data: data.copyWith(textScaleFactor: 1), child: child!);
          },
        ),
    );
  }
}